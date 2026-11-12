import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/presentation/widgets/app_tab_bar.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/character_cubit.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_colors_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_icons_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/time_helper.dart';
import 'package:checkpoint/features/habit/presentation/popups/habit_options_popup.dart';
import 'package:checkpoint/features/habit/presentation/popups/habit_popup.dart';
import 'package:checkpoint/features/habit/presentation/widgets/empty_habits_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

enum _Tab { active, archived }

// MARK: - Page
class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HabitsCubit>()..load()),
        BlocProvider(create: (context) => sl<CharacterCubit>()..load()),
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
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habitsState = context.watch<HabitsCubit>().state;
    final colorScheme = ColorScheme.of(context);

    Future<void> createHabit() async {
      final habit = await showCreateHabit(context);
      if (habit == null || !context.mounted) return;
      context.read<HabitsCubit>().create(habit);
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppSliverAppBar(
              title: LocaleKeys.habits_title.tr(),
              subtitle: LocaleKeys.habits_subtitle.tr().toUpperCase(),
              actions: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  onPressed: createHabit,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SliverPadding(
              padding: const .symmetric(horizontal: AppPaddings.m),
              sliver: SliverToBoxAdapter(
                child: AppTabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: _TabContent(
                        title: LocaleKeys.habits_tab_active.tr(),
                        count: _tabController.index == _Tab.active.index
                            ? habitsState.activated.length
                            : null,
                      ),
                    ),
                    Tab(
                      child: _TabContent(
                        title: LocaleKeys.habits_tab_archived.tr(),
                        count: _tabController.index == _Tab.archived.index
                            ? habitsState.archived.length
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: AppShimmer(
          isLoading: habitsState.isLoading,
          child: TabBarView(
            controller: _tabController,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPaddings.l),
                child: _ActiveHabits(
                  habits: habitsState.activated,
                  onCreateTapped: createHabit,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPaddings.l),
                child: _ArchivedHabits(
                  habitsState.archived,
                  onActiveHabbitsTapped: () => _tabController.animateTo(0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MARK: - Active Habits Tab
class _ActiveHabits extends StatelessWidget {
  const _ActiveHabits({required this.habits, required this.onCreateTapped});

  final List<Habit> habits;
  final VoidCallback onCreateTapped;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    return SingleChildScrollView(
      child: habits.isEmpty
          ? Column(
              spacing: AppPaddings.m,
              children: [
                EmptyHabitsCard(type: .createHabit, onPressed: onCreateTapped),
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
          : Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.habits_active_daily_routine_title
                          .tr()
                          .toUpperCase(),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      LocaleKeys.habits_active_daily_routine_count.tr(
                        namedArgs: {
                          "count": habits
                              .where((habit) => habit.isActiveToday)
                              .length
                              .toString(),
                        },
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppPaddings.m),
                Column(
                  spacing: AppPaddings.s,
                  children: habits.map((habit) => _ActiveHabit(habit)).toList(),
                ),
              ],
            ),
    );
  }
}

// MARK: - Active Habit Cell
class _ActiveHabit extends StatelessWidget {
  const _ActiveHabit(this.habit);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    Future<void> editHabit() async {
      final updatedHabit = await showEditHabit(context, habit);
      if (updatedHabit == null || !context.mounted) return;
      context.read<HabitsCubit>().create(updatedHabit);
    }

    Future<void> showOptions() async {
      final result = await showHabitOptions(context);
      if (result == null || !context.mounted) return;
      switch (result) {
        case HabitOptions.edit:
          editHabit();
        case HabitOptions.archive:
          context.read<HabitsCubit>().toggleArchiveState(habit);
        case HabitOptions.delete:
          context.read<HabitsCubit>().delete(habit);
      }
    }

    void toggleActive() {
      context.read<HabitsCubit>().toggleActiveState(habit);
    }

    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return AppCard(
      child: Column(
        spacing: AppPaddings.m,
        children: [
          Row(
            spacing: AppPaddings.s,
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: AppPaddings.s,
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: habit.color.background,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        habit.icon.iconPath,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          habit.color.foreground,
                          .srcIn,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: .start,
                    spacing: AppPaddings.xs,
                    children: [
                      Text(
                        habit.title,
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      if (habit.notificationTime != null)
                        Text(
                          habit.notificationTime!.toTimeOfDay().format(context),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: showOptions,
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.flame),
                  Text(
                    habit.streak.toString(),
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  Text(
                    " ${LocaleKeys.habits_active_cell_streak_days.tr()}",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),

              Row(
                spacing: AppPaddings.s,
                children: [
                  Text(
                    LocaleKeys.habits_active_cell_on_for_today.tr(),
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: ColorScheme.of(context).onSurfaceVariant,
                    ),
                  ),
                  Switch(
                    value: habit.isActiveToday,
                    onChanged: (_) => toggleActive(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// MARK: - Acchived Habits Tab

class _ArchivedHabits extends StatelessWidget {
  const _ArchivedHabits(this.habits, {required this.onActiveHabbitsTapped});

  final List<Habit> habits;
  final VoidCallback onActiveHabbitsTapped;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return SingleChildScrollView(
      child: habits.isEmpty
          ? Column(
              spacing: AppPaddings.m,
              children: [
                EmptyHabitsCard(
                  type: .archiveHabits,
                  onPressed: onActiveHabbitsTapped,
                ),
                Text(
                  LocaleKeys.habits_archived_hint_title.tr(),
                  style: TextTheme.of(context).labelMedium,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: .start,
              children: [
                Column(
                  crossAxisAlignment: .start,

                  children: [
                    Text(
                      LocaleKeys.habits_archived_title.tr(),
                      style: textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      LocaleKeys.habits_archived_subtitle.tr(
                        namedArgs: {
                          "count": habits
                              .where((habit) => habit.isActiveToday)
                              .length
                              .toString(),
                        },
                      ),
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppPaddings.m),
                Column(
                  spacing: AppPaddings.s,
                  children: habits
                      .map((habit) => _ArchivedHabit(habit))
                      .toList(),
                ),
              ],
            ),
    );
  }
}

// MARK: - Archived Cell
class _ArchivedHabit extends StatelessWidget {
  const _ArchivedHabit(this.habit);
  final Habit habit;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return AppCard(
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                habit.title,
                maxLines: 5,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                LocaleKeys.habits_archived_status.tr(),
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppPaddings.s),
          Text(
            LocaleKeys.habits_archived_info.tr(
              namedArgs: {
                "date": habit.archivedDate?.formatted ?? 'n/a',
                "streak": habit.bestStreak.toString(),
              },
            ),
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppPaddings.m),
          FilledButton(
            style: FilledButton.styleFrom(
              foregroundColor: colorScheme.primaryLight,
              backgroundColor: colorScheme.primaryContainer,
            ),
            onPressed: () =>
                context.read<HabitsCubit>().toggleArchiveState(habit),
            child: Text(LocaleKeys.habits_archived_restore.tr()),
          ),
        ],
      ),
    );
  }
}

// MARK: - TabContent
class _TabContent extends StatelessWidget {
  const _TabContent({required this.title, this.count});
  final String title;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    return Row(
      spacing: AppPaddings.xs,
      mainAxisAlignment: .center,
      children: [
        Text(
          title,
          textAlign: .center,
          style: textTheme.labelMedium?.copyWith(color: colorScheme.onSurface),
        ),
        if (count != null)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.xs),
              child: Center(
                child: Text(
                  count.toString(),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

extension on DateTime {
  String get formatted {
    return DateFormat('MMM d').format(this);
  }
}
