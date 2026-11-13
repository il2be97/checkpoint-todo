import 'package:checkpoint/features/character/presentation/widgets/character_relax_card.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habits_helper.dart';
import 'package:checkpoint/features/habit/presentation/provider/habits_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_pill.dart';
import 'package:checkpoint/core/presentation/widgets/app_svg_picture.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_colors_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_icons_helper.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

// MARK: - Section
class DailyHabitsSection extends ConsumerWidget {
  const DailyHabitsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final habitsState = ref.watch(habitsProvider);
    final habits = (habitsState.value ?? []).activeToday;

    return habits.isEmpty
        ? CharacterRelaxCard(
            onPressed: () => GoRouter.of(context).goNamed('habits'),
            title: LocaleKeys.home_empty_habits_title.tr(),
            subtitle: LocaleKeys.home_empty_habits_subtitle.tr(),
            buttonText: LocaleKeys.home_empty_habits_button.tr(),
          )
        : Column(
            spacing: AppPaddings.s,
            children: [
              // Header
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    LocaleKeys.home_todays_missions.tr(),
                    style: TextTheme.of(context).titleLarge,
                  ),
                  Row(
                    spacing: AppPaddings.xs,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: colorScheme.positive,
                      ),
                      Text(
                        LocaleKeys.home_todays_completed_info.tr(
                          namedArgs: {
                            "completed": habits
                                .where((habit) => habit.done)
                                .length
                                .toString(),
                            "general": habits.length.toString(),
                          },
                        ),
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.positive,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Habits list
              ...habits.map(
                (habit) =>
                    _HabitCell(habit, onComplete: ref.habitsNotifier.complete),
              ),

              // Habits tip
              if (habits.inProgress.isNotEmpty)
                Row(
                  crossAxisAlignment: .center,
                  spacing: AppPaddings.s,
                  children: [
                    Icon(Icons.gpp_maybe_outlined, color: colorScheme.warning),
                    Text(
                      LocaleKeys.home_complete_hint.tr(),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
            ],
          );
  }
}

extension on WidgetRef {
  HabitsNotifier get habitsNotifier => read(habitsProvider.notifier);
}

// MARK: - Quest Cell
class _HabitCell extends StatelessWidget {
  const _HabitCell(this.habit, {required this.onComplete});

  final Habit habit;
  final ValueSetter<Habit> onComplete;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return AppCard(
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            spacing: AppPaddings.m,
            children: [
              // Header
              Row(
                spacing: AppPaddings.s,
                children: [
                  AppSvgPicture(
                    habit.icon.iconPath,
                    color: habit.color.foreground,
                    height: 13,
                  ),
                  Text(
                    habit.title,
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),

              Row(
                spacing: AppPaddings.s,
                children: [
                  // Streaks
                  Row(
                    children: [
                      // Current Streak
                      const AppSvgPicture(
                        AppIcons.flame,
                        height: 24,
                        width: 22,
                      ),
                      Text(
                        habit.streak.toString(),
                        style: textTheme.headlineLarge?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(
                        " ${LocaleKeys.habits_active_cell_streak_days.tr()}",
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primaryText,
                        ),
                      ),
                    ],
                  ),

                  // Best Streak
                  AppPill(
                    child: Row(
                      spacing: AppPaddings.xs,
                      children: [
                        const Icon(Icons.emoji_events_outlined, size: 13),
                        Text(
                          LocaleKeys.home_best_streak.tr(
                            namedArgs: {"streak": habit.bestStreak.toString()},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Total
              Row(
                spacing: AppPaddings.s,
                children: [
                  AppPill(
                    child: Text(
                      LocaleKeys.home_total_info.tr(
                        namedArgs: {"days": habit.total.toString()},
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                  Text(
                    LocaleKeys.home_exp_reward.tr(
                      namedArgs: {"exp": habit.exp.toString()},
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.textSubtle,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Checkmark button
          Column(
            spacing: AppPaddings.xs,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  foregroundColor: habit.done
                      ? colorScheme.surface
                      : colorScheme.onSurfaceVariant,
                  backgroundColor: habit.done
                      ? colorScheme.positive
                      : colorScheme.surfaceContainerHighest,
                  side: habit.done
                      ? null
                      : BorderSide(color: colorScheme.textSubtle, width: 1.0),
                ),
                onPressed: () => onComplete(habit),
                icon: const Icon(Icons.check),
              ),
              Text(
                habit.done
                    ? LocaleKeys.home_done.tr()
                    : LocaleKeys.home_check_in.tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
