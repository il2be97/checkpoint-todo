import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class HabitsRepository extends IHabitsRepository {
  @override
  TaskEither<Error, List<Habit>> read(DateTime date) {
    return .right([]);
  }

  @override
  TaskEither<Error, List<Habit>> readActive() {
    return .right([]);
  }

  @override
  TaskEither<Error, List<Habit>> readArchived() {
    return .right([]);
  }
}
