import 'package:checkpoint/core/models/time.dart';

class HabitHiveModel {
  final String id;
  final String title;
  final String icon;
  final String color;
  final Time? notificationTime;
  final DateTime lastCheckedDate;
  final int streak;
  final int bestStreak;
  final int total;
  final DateTime? pausedDate;
  final DateTime? lastDoneDate;
  final DateTime? archivedDate;

  new({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.notificationTime,
    required this.lastCheckedDate,
    required this.streak,
    required this.bestStreak,
    required this.total,
    required this.pausedDate,
    required this.lastDoneDate,
    required this.archivedDate,
  });
}
