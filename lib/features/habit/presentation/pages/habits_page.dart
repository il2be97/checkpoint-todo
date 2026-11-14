import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/presentation/widgets/app_tab_bar.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habits_helper.dart';
import 'package:checkpoint/features/habit/presentation/popups/habit_popup.dart';
import 'package:checkpoint/features/habit/presentation/provider/habits_notifier.dart';
import 'package:checkpoint/features/habit/presentation/widgets/active_habits_section.dart';
import 'package:checkpoint/features/habit/presentation/widgets/archived_habits_section.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HabitTab { active, archived }

typedef HabitEmptyCardBuilder = Widget Function(
  BuildContext context,
  HabitTab tab,
);

// MARK: - Page
class HabitsPage extends ConsumerStatefulWidget {
  const HabitsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HabitsPageState();
}

class _HabitsPageState extends ConsumerState<HabitsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: HabitTab.values.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habitsState = ref.watch(habitsProvider);
    final habits = habitsState.value ?? [];
    final colorScheme = ColorScheme.of(context);

    Future<void> createHabit() async {
      final habit = await showCreateHabit(context);
      if (habit == null || !context.mounted) return;
      ref.read(habitsProvider.notifier).create(habit);
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
                        count: _tabController.index == HabitTab.active.index
                            ? habits.active.length
                            : null,
                      ),
                    ),
                    Tab(
                      child: _TabContent(
                        title: LocaleKeys.habits_tab_archived.tr(),
                        count: _tabController.index == HabitTab.archived.index
                            ? habits.archived.length
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
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppPaddings.m),
                  child: ActiveHabitsSection(),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddings.m),
                  child: ArchivedHabitsSection(
                    onActiveHabbitsTapped: () =>
                        _tabController.animateTo(HabitTab.active.index),
                  ),
                ),
              ),
            ],
          ),
        ),
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
