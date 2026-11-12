import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:collection/collection.dart';

extension HabitsX on List<Habit> {
  List<Habit> get active =>
      where((habit) => habit.archivedDate == null).toList();
  List<Habit> get archived =>
      where((habit) => habit.archivedDate != null).toList();

  List<Habit> get activeToday => where((habit) => habit.isActiveToday).toList();
  List<Habit> get completed => where((habit) => habit.done).toList();
  List<Habit> get inProgress => whereNot((habit) => habit.done).toList();
}
