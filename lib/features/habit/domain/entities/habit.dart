import 'package:checkpoint/features/habit/domain/entities/habit_colors.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_icons.dart';
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
    required HabitIcons icon,
    required HabitColors color,
    required bool isActiveToday,
    required int streak,
    required int bestStreak,
    required int exp,
    required int total,
    required bool done,
    DateTime? archivedDate,
    Time? notificationTime,
  }) = _Habit;

  factory Habit.create({
    required String title,
    required HabitIcons icon,
    required HabitColors color,
    required Time? notificationTime,
    int exp = 100,
    int total = 0,
    int bestStreak = 0,
    int streak = 0,
    bool isActiveToday = true,
    bool done = false,
  }) {
    return _Habit(
      id: const UuidV8().generate(),
      title: title,
      icon: icon,
      isActiveToday: isActiveToday,
      color: color,
      streak: streak,
      bestStreak: bestStreak,
      notificationTime: notificationTime,
      exp: 30,
      total: 0,
      done: false,
    );
  }

  factory Habit.mock() {
    return Habit.create(
      title: 'mock',
      icon: HabitIcons.book,
      color: HabitColors.lavender,
      streak: 1,
      bestStreak: 1,
      notificationTime: Time.now(),
      isActiveToday: true,
      total: 0,
      exp: 30,
      done: false,
    );
  }
}

extension HabitX on Habit {
  bool get isArchived {
    return archivedDate != null;
  }
}
