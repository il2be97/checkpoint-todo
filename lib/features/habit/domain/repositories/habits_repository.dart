import 'package:checkpoint/features/habit/data/data_sources/local/local_habit_data_source.dart';
import 'package:checkpoint/features/habit/data/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habits_repository.g.dart';

abstract class IHabitsRepository {
  TaskEither<Error, List<Habit>> read();
  TaskEither<Error, Habit> update(Habit habit);
  TaskEither<Error, List<Habit>> updateAll(List<Habit> habits);
  TaskEither<Error, Habit> create(Habit habit);
  TaskEither<Error, Habit?> delete(Habit habit);
}

@riverpod
IHabitsRepository habitRepository(Ref ref) {
  final dataSource = ref.read(localHabitDataSourceProvider);
  return HabitsRepository(dataSource);
}
