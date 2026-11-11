import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';

import 'package:checkpoint/features/habit/presentation/widgets/empty_habits_card.dart';
import 'package:checkpoint/features/habit/presentation/widgets/player_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HabitsCubit>()..load()),
        BlocProvider(create: (context) => sl<PlayerCubit>()..load()),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final playerState = context.watch<PlayerCubit>().state;
    final habitsState = context.watch<HabitsCubit>().state;

    return Scaffold(
      body: AppShimmer(
        isLoading: playerState.isLoading || habitsState.isLoading,
        child: CustomScrollView(
          slivers: [
            AppSliverAppBar(
              title: LocaleKeys.home_title.tr(),
              subtitle: now.formatted.toUpperCase(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.s)),
            SliverPadding(
              padding: const .symmetric(horizontal: AppPaddings.m),
              sliver: SliverToBoxAdapter(
                child: PlayerCard(playerState.uPlayer),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
            SliverPadding(
              padding: const .symmetric(horizontal: AppPaddings.m),
              sliver: SliverToBoxAdapter(child: _Habits(habitsState.habits)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
          ],
        ),
      ),
    );
  }
}

class _Habits extends StatelessWidget {
  const _Habits(this.habits);

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return habits.isEmpty
        ? EmptyHabitsCard(
            type: .openHabbits,
            onPressed: () => GoRouter.of(context).go('/habits'),
          )
        : Column(
            spacing: AppPaddings.s,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    LocaleKeys.home_todays_missions.tr(),
                    style: TextTheme.of(context).headlineSmall,
                  ),
                  Text('-', style: textTheme.labelSmall),
                ],
              ),
            ],
          );
  }
}

extension on DateTime {
  String get formatted {
    return DateFormat('EEEE, MMM d').format(this);
  }
}
