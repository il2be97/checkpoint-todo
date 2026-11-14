import 'package:checkpoint/core/storage/hive/models/habit_hive_model.dart';
import 'package:checkpoint/features/habit/data/dtos/habit_dto.dart';

extension HabitDtoToHive on HabitDTO {
  HabitHiveModel toHive() => HabitHiveModel(
    id: id,
    title: title,
    icon: icon,
    color: color,
    notificationTime: notificationTime,
    lastCheckedDate: lastCheckedDate,
    streak: streak,
    bestStreak: bestStreak,
    total: total,
    pausedDate: pausedDate,
    lastDoneDate: lastDoneDate,
    archivedDate: archivedDate,
  );
}

extension HabitHibeToDTO on HabitHiveModel {
  HabitDTO toDTO() => HabitDTO(
    id: id,
    title: title,
    icon: icon,
    color: color,
    notificationTime: notificationTime,
    lastCheckedDate: lastCheckedDate,
    streak: streak,
    bestStreak: bestStreak,
    total: total,
    pausedDate: pausedDate,
    lastDoneDate: lastDoneDate,
    archivedDate: archivedDate,
  );
}
