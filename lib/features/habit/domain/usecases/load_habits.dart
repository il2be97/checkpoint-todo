import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadHabits {
  const LoadHabits(this.habitsRepository);
  final IHabitsRepository habitsRepository;

  TaskEither<Error, List<Habit>> call(DateTime date) {
    return habitsRepository.read(date);
  }
}
