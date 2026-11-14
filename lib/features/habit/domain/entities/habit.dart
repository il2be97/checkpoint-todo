import 'dart:math';

import 'package:checkpoint/core/helpers/date_time_helper.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_color.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_icon.dart';
import 'package:checkpoint/core/models/time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v8.dart';

part 'habit.freezed.dart';

@freezed
abstract class Habit with _$Habit {
  const Habit._();

  const factory Habit({
    required String id,
    required String title,
    required HabitIcon icon,
    required HabitColor color,
    required DateTime lastCheckedDate,
    required int streak,
    required int bestStreak,
    required int total,
    required Time? notificationTime,
    required DateTime? pausedDate,
    required DateTime? lastDoneDate,
    required DateTime? archivedDate,
  }) = _Habit;

  factory Habit.create({
    required String title,
    required HabitIcon icon,
    required HabitColor color,
    Time? notificationTime,
    DateTime? now,
  }) {
    return _Habit(
      id: const UuidV8().generate(),
      title: title,
      icon: icon,
      color: color,
      notificationTime: notificationTime,
      lastCheckedDate: (now ?? DateTime.now()).dateOnly,
      streak: 0,
      bestStreak: 0,
      total: 0,
      pausedDate: null,
      lastDoneDate: null,
      archivedDate: null,
    );
  }

  factory Habit.mock() => Habit.create(
    title: 'mock',
    icon: HabitIcon.book,
    color: HabitColor.lavender,
  );
}

extension HabitActions on Habit {
  Habit complete({DateTime? date}) {
    final today = (date ?? DateTime.now()).dateOnly;
    if (!canCompleteOn(today)) return this;
    final newStreak = streak + 1;
    final newTotal = total + 1;
    final updatedBestStreak = newStreak > bestStreak ? newStreak : bestStreak;

    return copyWith(
      total: newTotal,
      streak: newStreak,
      bestStreak: updatedBestStreak,
      lastCheckedDate: today,
      lastDoneDate: today,
      pausedDate: null,
    );
  }

  Habit undoneComplete({DateTime? date}) {
    final today = (date ?? DateTime.now()).dateOnly;
    if (!canUndoCompleteOn(today)) return this;
    final revertedTotal = max(0, total - 1);
    final revertedStreak = max(0, streak - 1);
    final revertedBest = bestStreak == streak ? revertedStreak : bestStreak;

    return copyWith(
      total: revertedTotal,
      streak: revertedStreak,
      bestStreak: revertedBest,
      lastCheckedDate: today,
      lastDoneDate: null,
      pausedDate: null,
    );
  }

  Habit togglePauseToday(bool shouldPause, {DateTime? date}) {
    final today = (date ?? DateTime.now()).dateOnly;
    if (!canTogglePauseOn(today, shouldPause: shouldPause)) return this;
    return copyWith(
      pausedDate: shouldPause ? today : null,
      lastCheckedDate: shouldPause ? today.nextDay : today,
    );
  }

  Habit archive({DateTime? date}) {
    if (!canArchive) return this;
    return copyWith(archivedDate: (date ?? DateTime.now()).dateOnly);
  }

  Habit unarchive({DateTime? date}) {
    if (!canUndoArchive) return this;
    final today = (date ?? DateTime.now()).dateOnly;
    return copyWith(
      archivedDate: null,
      pausedDate: null,
      lastCheckedDate: today,
    );
  }
}

typedef HabitEvaluation = ({Habit habit, int missedDays});

extension HabitEvaluationX on Habit {
  HabitEvaluation evaluateMissedDays({DateTime? date}) {
    if (isArchived) return (habit: this, missedDays: 0);
    final today = (date ?? DateTime.now()).dateOnly;
    final lastCheck = lastCheckedDate.dateOnly;
    if (!lastCheck.isBefore(today)) return (habit: this, missedDays: 0);
    return (
      habit: copyWith(streak: 0, lastCheckedDate: today),
      missedDays: lastCheck.daysTo(today),
    );
  }
}

extension HabitX on Habit {
  bool get isArchived => archivedDate != null;
  bool get isDoneToday => lastDoneDate.isSameDay(DateTime.now());
  bool get isPausedToday => pausedDate.isSameDay(DateTime.now());
  bool get isActiveToday => !isPausedToday && !isArchived;

  int get exp => 30;
}

extension HabitValidationX on Habit {
  bool canCompleteOn(DateTime date) {
    return !isArchived && !lastDoneDate.isSameDay(date);
  }

  bool canUndoCompleteOn(DateTime date) {
    return !isArchived && lastDoneDate.isSameDay(date);
  }

  bool canPauseOn(DateTime date) {
    return !isArchived &&
        !lastDoneDate.isSameDay(date) &&
        !pausedDate.isSameDay(date);
  }

  bool canUnpauseOn(DateTime date) => !isArchived && pausedDate.isSameDay(date);

  bool canTogglePauseOn(DateTime date, {bool? shouldPause}) {
    if (shouldPause == true) return canPauseOn(date);
    if (shouldPause == false) return canUnpauseOn(date);
    return canPauseOn(date) || canUnpauseOn(date);
  }

  bool get canCompleteToday => canCompleteOn(DateTime.now());
  bool get canUndoCompleteToday => canUndoCompleteOn(DateTime.now());
  bool get canPauseToday => canPauseOn(DateTime.now());
  bool get canUnpauseToday => canUnpauseOn(DateTime.now());
  bool get canTogglePauseToday => canTogglePauseOn(DateTime.now());
  bool get canArchive => archivedDate == null;
  bool get canUndoArchive => archivedDate != null;
}
