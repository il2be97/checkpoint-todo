import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_decoration.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/presentation/blocs/active_quests_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/archived_habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:checkpoint/features/habit/presentation/widgets/empty_quests_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum _Tab { active, archived }

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ActiveQuestsCubit>()..load()),
        BlocProvider(create: (context) => sl<ArchivedHabitsCubit>()..load()),
        BlocProvider(create: (context) => sl<PlayerCubit>()..load()),
      ],
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
    _tabController = TabController(length: _Tab.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            BlocBuilder<ActiveQuestsCubit, ActiveQuestsState>(
              builder: (context, state) => AppShimmer(
                isLoading: state.isLoading,
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddings.l),
                  child: _ActiveHabits(state.uQuest),
                ),
              ),
            ),
            BlocBuilder<ArchivedHabitsCubit, ArchivedHabitsState>(
              builder: (context, state) => AppShimmer(
                isLoading: state.isLoading,
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddings.l),
                  child: _ArchivedHabits(state.uQuest),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActiveHabits extends StatelessWidget {
  const _ActiveHabits(this.quests);

  final List<Quest> quests;

  @override
  Widget build(BuildContext context) {
    return quests.isEmpty
        ? Column(
            spacing: AppPaddings.m,
            children: [
              EmptyQuestsCard(type: .createHabit, onPressed: () {}),
              Text(
                LocaleKeys.habits_active_hint_title.tr(),
                style: TextTheme.of(context).labelMedium,
              ),
              TextButton(
                onPressed: () => GoRouter.of(context).go('/home'),
                child: Text(LocaleKeys.habits_active_hint_button.tr()),
              ),
            ],
          )
        : const Placeholder();
  }
}

class _ArchivedHabits extends StatelessWidget {
  const _ArchivedHabits(this.quests);

  final List<Quest> quests;

  @override
  Widget build(BuildContext context) {
    return quests.isEmpty
        ? Column(
            spacing: AppPaddings.m,
            children: [
              EmptyQuestsCard(type: .archiveHabits, onPressed: () {}),
              Text(
                LocaleKeys.habits_archived_hint_title.tr(),
                style: TextTheme.of(context).labelMedium,
              ),
            ],
          )
        : const Placeholder();
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
      padding: const .all(AppPaddings.xs),
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
