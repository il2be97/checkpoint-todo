import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_decoration.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/widgets/empty_quests_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => sl<HabitsCubit>()..load(),
      child: const HabitsPage(),
    );
  }

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: HabitTab.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HabitsCubit, HabitsState>(
        builder: (context, state) {
          return AppShimmer(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  AppSliverAppBar(
                    title: LocaleKeys.habits_title.tr(),
                    subtitle: LocaleKeys.habits_subtitle.tr().toUpperCase(),
                  ),
                  SliverPadding(
                    padding: const .symmetric(horizontal: AppPaddings.m),
                    sliver: SliverToBoxAdapter(
                      child: _HabitTabBar(controller: _tabController),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppPaddings.m),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  Center(
                    child: EmptyQuestsCard(
                      type: .createHabit,
                      onPressed: () {},
                      level: .ragged,
                    ),
                  ),
                  Center(
                    child: EmptyQuestsCard(
                      type: .archiveHabits,
                      onPressed: () {},
                      level: .ragged,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ActivePage extends StatelessWidget {
  const _ActivePage();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ArchivedPage extends StatelessWidget {
  const ArchivedPage();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HabitTabBar extends StatelessWidget {
  const _HabitTabBar({required this.controller});
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .hardEdge,
      decoration: AppDecoration.forCard(context),
      child: TabBar(
        controller: controller,
        tabs: [
          Tab(text: LocaleKeys.habits_tab_active.tr()),
          Tab(text: LocaleKeys.habits_tab_archived.tr()),
        ],
      ),
    );
  }
}
