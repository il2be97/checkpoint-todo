import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/player_progress.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_overview_cubit.dart';

import 'package:checkpoint/features/habit/presentation/widgets/empty_quests_card.dart';
import 'package:checkpoint/features/habit/presentation/widgets/player_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => sl<PlayerOverviewCubit>()..load(),
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      body: BlocBuilder<PlayerOverviewCubit, PlayerOverviewState>(
        builder: (context, state) {
          return AppShimmer(
            isLoading: state.isLoading,
            child: CustomScrollView(
              slivers: [
                AppSliverAppBar(
                  title: LocaleKeys.home_title.tr(),
                  subtitle: now.formatted.toUpperCase(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppPaddings.s),
                ),
                SliverToBoxAdapter(child: PlayerCard(state.uPlayer)),
                SliverToBoxAdapter(
                  child: _Quests(
                    state.uQuests,
                    state.uPlayer.progress.levelType,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Quests extends StatelessWidget {
  const _Quests(this.quests, this.level);

  final List<Quest> quests;
  final PlayerLevel level;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.m),
      child: quests.isEmpty
          ? EmptyQuestsCard(type: .openHabbits, onPressed: () {}, level: level)
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
            ),
    );
  }
}

extension on DateTime {
  String get formatted {
    return DateFormat('EEEE, MMM d').format(this);
  }
}
