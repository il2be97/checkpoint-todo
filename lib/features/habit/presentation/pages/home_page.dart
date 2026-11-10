import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/presentation/blocs/active_quests_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/quests_cubit.dart';

import 'package:checkpoint/features/habit/presentation/widgets/empty_quests_card.dart';
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
        BlocProvider(create: (context) => sl<QuestsCubit>()..load()),
        BlocProvider(create: (context) => sl<PlayerCubit>()..load()),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final playerState = context.watch<PlayerCubit>().state;
    final questsState = context.watch<ActiveQuestsCubit>().state;

    return Scaffold(
      body: AppShimmer(
        isLoading: playerState.isLoading || questsState.isLoading,
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
              sliver: SliverToBoxAdapter(child: _Quests(questsState.uQuest)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
          ],
        ),
      ),
    );
  }
}

class _Quests extends StatelessWidget {
  const _Quests(this.quests);

  final List<Quest> quests;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return quests.isEmpty
        ? EmptyQuestsCard(
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
