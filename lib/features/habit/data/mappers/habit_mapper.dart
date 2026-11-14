import 'package:checkpoint/features/habit/data/dtos/habit_dto.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_color.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_icon.dart';
import 'package:material_ui/material_ui.dart';

extension HabitMapper on Habit {
  HabitDTO toDTO() => HabitDTO(
    id: id,
    title: title,
    icon: icon.name,
    color: color.name,
    lastCheckedDate: lastCheckedDate,
    streak: streak,
    bestStreak: bestStreak,
    total: total,
    notificationTime: notificationTime,
    pausedDate: pausedDate,
    lastDoneDate: lastDoneDate,
    archivedDate: archivedDate,
  );
}

extension HabitDTOMapper on HabitDTO {
  Habit toEntity() => Habit(
    id: id,
    title: title,
    icon: HabitIcon.from(icon),
    color: HabitColor.from(color),
    lastCheckedDate: lastCheckedDate,
    streak: streak,
    bestStreak: bestStreak,
    total: total,
    notificationTime: notificationTime,
    pausedDate: pausedDate,
    lastDoneDate: lastDoneDate,
    archivedDate: archivedDate,
  );
}
