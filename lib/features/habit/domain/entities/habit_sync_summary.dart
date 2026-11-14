import 'dart:math';

import 'package:checkpoint/core/helpers/date_time_helper.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_sync_summary.freezed.dart';

@freezed
abstract class HabitSyncSummary with _$HabitSyncSummary {
  const HabitSyncSummary._();

  const factory HabitSyncSummary({
    required List<Habit> habits,
    @Default(0) int missedDays,
    @Default(0) int missedHabitsCount,
    @Default(0) int completedToday,
  }) = _HabitSyncSummary;

  bool get hasPenalty => missedHabitsCount > 0;

  factory HabitSyncSummary.fromHabits(List<Habit> habits, DateTime now) {
    int maxMissedDays = 0;
    int totalMissedHabits = 0;
    int completedCount = 0;
    final resultList = <Habit>[];

    for (final habit in habits) {
      final eval = habit.evaluateMissedDays(date: now);
      final currentHabit = eval.habit;

      if (eval.missedDays > 0) {
        maxMissedDays = max(maxMissedDays, eval.missedDays);
        totalMissedHabits += eval.missedDays;
      }

      if (currentHabit.lastDoneDate.isSameDay(now)) {
        completedCount++;
      }

      resultList.add(currentHabit);
    }

    return HabitSyncSummary(
      habits: resultList,
      missedDays: maxMissedDays,
      missedHabitsCount: totalMissedHabits,
      completedToday: completedCount,
    );
  }
}
