import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_habit.g.dart';

class CreateHabit {
  final IHabitsRepository habitsRepository;

  CreateHabit(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.create(habit);
  }
}

@riverpod
CreateHabit createHabit(Ref ref) {
  return CreateHabit(ref.read(habitRepositoryProvider));
}
