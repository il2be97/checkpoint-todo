import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateHabit {
  final IHabitsRepository habitsRepository;

  CreateHabit(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.create(habit);
  }
}
