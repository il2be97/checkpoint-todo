import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/character/presentation/widgets/character_relax_card.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habits_helper.dart';
import 'package:checkpoint/features/habit/presentation/provider/habits_notifier.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// MARK: - Acchived Habits Tab

import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:flutter/material.dart';

class ArchivedHabitsSection extends ConsumerWidget {
  const ArchivedHabitsSection({super.key, required this.onActiveHabbitsTapped});

  final VoidCallback onActiveHabbitsTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final habitsState = ref.watch(habitsProvider);
    final habits = (habitsState.value ?? []).archived;

    return habits.isEmpty
        ? Column(
            spacing: AppPaddings.m,
            children: [
              CharacterRelaxCard(
                onPressed: onActiveHabbitsTapped,
                title: LocaleKeys.habits_archived_empty_title.tr(),
                subtitle: LocaleKeys.habits_archived_empty_subtitle.tr(),
                buttonText: LocaleKeys.habits_archived_empty_button.tr(),
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
                    .map(
                      (habit) => _ArchivedHabit(
                        habit,
                        onToggleArchive: ref.habitsNotifier.toggleActive,
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

// MARK: - Archived Cell
class _ArchivedHabit extends StatelessWidget {
  const _ArchivedHabit(this.habit, {required this.onToggleArchive});

  final Habit habit;
  final ValueSetter<Habit> onToggleArchive;

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
            onPressed: () => onToggleArchive(habit),
            child: Text(LocaleKeys.habits_archived_restore.tr()),
          ),
        ],
      ),
    );
  }
}

// MARK: - Date Format
extension on DateTime {
  String get formatted {
    return DateFormat('MMM d').format(this);
  }
}
