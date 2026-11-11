import 'package:checkpoint/features/habit/domain/entities/habit_colors.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_icons.dart';
import 'package:checkpoint/features/habit/domain/entities/time.dart';

class Habit {
  final String title;
  final HabitIcons icon;
  final HabitColors color;
  final Time time;

  Habit({
    required this.title,
    required this.icon,
    required this.color,
    required this.time,
  });

  factory Habit.mock() {
    return Habit(title: '', icon: .book, color: .lavender, time: Time.now());
  }
}
