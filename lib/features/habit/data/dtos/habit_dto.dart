import 'package:checkpoint/core/models/time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_dto.freezed.dart';

@freezed
abstract class HabitDTO with _$HabitDTO {
  const HabitDTO._();

  const factory HabitDTO({
    required String id,
    required String title,
    required String icon,
    required String color,
    required DateTime lastCheckedDate,
    required int streak,
    required int bestStreak,
    required int total,
    required Time? notificationTime,
    required DateTime? pausedDate,
    required DateTime? lastDoneDate,
    required DateTime? archivedDate,
  }) = _HabitDTO;
}
