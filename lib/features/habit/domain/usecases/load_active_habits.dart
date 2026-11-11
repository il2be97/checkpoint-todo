import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadActiveHabits {
  const LoadActiveHabits(this.habitsRepository);

  final IHabitsRepository habitsRepository;

  TaskEither<Error, List<Habit>> call() {
    return habitsRepository.readActive();
  }
}
