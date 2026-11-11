import 'package:checkpoint/features/habit/domain/entities/habit_colors.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_icons.dart';
import 'package:checkpoint/features/habit/domain/entities/time.dart';
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
    DateTime? archivedDate,
    Time? notificationTime,
  }) = _Habit;

  factory Habit.create({
    required String title,
    required HabitIcons icon,
    required HabitColors color,
    required Time? notificationTime,
    int bestStreak = 1,
    int streak = 1,
    bool isActiveToday = true,
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
    );
  }
}

extension HabitX on Habit {
  bool get isArchived {
    return archivedDate != null;
  }
}
