import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/features/character/presentation/widgets/character_relax_card.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_colors_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_icons_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habits_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/time_helper.dart';
import 'package:checkpoint/features/habit/presentation/popups/habit_options_popup.dart';
import 'package:checkpoint/features/habit/presentation/provider/habits_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// MARK: - Active Habits Tab
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/presentation/popups/habit_popup.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ActiveHabitsSection extends ConsumerWidget {
  const ActiveHabitsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final habitsState = ref.watch(habitsProvider);
    final habits = (habitsState.value ?? []).active;

    Future<void> createHabit() async {
      final habit = await showCreateHabit(context);
      if (habit == null || !context.mounted) return;
      ref.read(habitsProvider.notifier).create(habit);
    }

    return habits.isEmpty
        ? Column(
            spacing: AppPaddings.m,
            children: [
              CharacterRelaxCard(
                onPressed: createHabit,
                title: LocaleKeys.habits_active_empty_title.tr(),
                subtitle: LocaleKeys.habits_active_empty_subtitle.tr(),
                buttonText: LocaleKeys.habits_active_empty_button.tr(),
              ),
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
                children: habits
                    .map(
                      (habit) => _ActiveHabitCell(
                        habit,
                        onEdit: ref.habitsNotifier.edit,
                        onArchive: ref.habitsNotifier.toggleArchive,
                        onDelete: ref.habitsNotifier.delete,
                        onToggleActive: ref.habitsNotifier.toggleActive,
                      ),
                    )
                    .toList(),
              ),
            ],
          );
  }
}

extension on WidgetRef {
  HabitsNotifier get habitsNotifier => read(habitsProvider.notifier);
}

// MARK: - Active Habit Cell
class _ActiveHabitCell extends StatelessWidget {
  const _ActiveHabitCell(
    this.habit, {
    required this.onEdit,
    required this.onArchive,
    required this.onDelete,
    required this.onToggleActive,
  });

  final Habit habit;
  final ValueSetter<Habit> onEdit;
  final ValueSetter<Habit> onArchive;
  final ValueSetter<Habit> onDelete;
  final ValueSetter<Habit> onToggleActive;

  @override
  Widget build(BuildContext context) {
    Future<void> editHabit() async {
      final updatedHabit = await showEditHabit(context, habit);
      if (updatedHabit == null || !context.mounted) return;
      onEdit(habit);
    }

    Future<void> showOptions() async {
      final result = await showHabitOptions(context);
      if (result == null || !context.mounted) return;

      switch (result) {
        case HabitOptions.edit:
          editHabit();
        case HabitOptions.archive:
          onArchive(habit);
        case HabitOptions.delete:
          onDelete(habit);
      }
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
                    onChanged: (_) => onToggleActive(habit),
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
