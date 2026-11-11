import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:fpdart/fpdart.dart';

abstract class IHabitsRepository {
  TaskEither<Error, List<Habit>> read(DateTime date);
  TaskEither<Error, Habit> update(Habit habit);
  TaskEither<Error, Habit> create(Habit habit);
  TaskEither<Error, Habit?> delete(Habit habit);
}
