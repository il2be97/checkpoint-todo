import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class ToggleHabitArchiveState {
  final IHabitsRepository habitsRepository;

  ToggleHabitArchiveState(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.update(
      habit.copyWith(
        archivedDate: habit.archivedDate == null ? DateTime.now() : null,
      ),
    );
  }
}
