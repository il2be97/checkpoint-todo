import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class ToggleHabitActiveState {
  final IHabitsRepository habitsRepository;

  ToggleHabitActiveState(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit, {required}) {
    return habitsRepository.update(
      habit.copyWith(isActiveToday: !habit.isActiveToday),
    );
  }
}
