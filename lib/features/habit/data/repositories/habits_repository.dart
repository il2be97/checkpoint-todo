import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class HabitsRepository extends IHabitsRepository {
  List<Habit> _habits = [Habit.mock()];

  @override
  TaskEither<Error, List<Habit>> read() {
    return .right(List.from(_habits));
  }

  @override
  TaskEither<Error, Habit> create(Habit habit) {
    return .Do((run) async {
      _habits.add(habit);
      return habit;
    });
  }

  @override
  TaskEither<Error, Habit> update(Habit habit) {
    return .Do((run) async {
      _habits = [for (final h in _habits) h.id == habit.id ? habit : h];
      return habit;
    });
  }

  @override
  TaskEither<Error, Habit?> delete(Habit habit) {
    return .Do((run) async {
      return _habits.remove(habit) ? habit : null;
    });
  }

  @override
  TaskEither<Error, List<Habit>> updateAll(List<Habit> habits) {
    // TODO: implement updateAll
    throw UnimplementedError();
  }
}
