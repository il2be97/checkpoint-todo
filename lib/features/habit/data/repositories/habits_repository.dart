import 'package:checkpoint/features/habit/data/data_sources/local/local_habit_data_source.dart';
import 'package:checkpoint/features/habit/data/mappers/habit_mapper.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class HabitsRepository extends IHabitsRepository {
  final ILocalHabitDataSource _localDataSource;

  new(this._localDataSource);

  @override
  TaskEither<Error, List<Habit>> read() {
    return .Do((run) async {
      final data = await _localDataSource.read();
      return data.map((habit) => habit.toEntity()).toList();
    });
  }

  @override
  TaskEither<Error, Habit> create(Habit habit) {
    return .Do((run) async {
      await _localDataSource.create(habit.toDTO());
      return habit;
    });
  }

  @override
  TaskEither<Error, Habit> update(Habit habit) {
    return .Do((run) async {
      await _localDataSource.update(habit.toDTO());
      return habit;
    });
  }

  @override
  TaskEither<Error, List<Habit>> updateAll(List<Habit> habits) {
    return .Do((run) async {
      await _localDataSource.updateAll(
        habits.map((habit) => habit.toDTO()).toList(),
      );
      return habits;
    });
  }

  @override
  TaskEither<Error, Habit?> delete(Habit habit) {
    return .Do((run) async {
      await _localDataSource.delete(habit.toDTO());
      return habit;
    });
  }
}
