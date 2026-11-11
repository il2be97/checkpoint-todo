import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:fpdart/fpdart.dart';

abstract class IHabitsRepository {
  TaskEither<Error, List<Habit>> read(DateTime date);
  TaskEither<Error, List<Habit>> readActive();
  TaskEither<Error, List<Habit>> readArchived();
}
