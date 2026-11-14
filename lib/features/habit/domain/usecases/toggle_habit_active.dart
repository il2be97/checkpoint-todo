import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_habit_active.g.dart';

class ToggleHabitActive {
  final IHabitsRepository habitsRepository;

  ToggleHabitActive(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit, {required bool shouldPause}) {
    return habitsRepository.update(habit.togglePauseToday(shouldPause));
  }
}

@riverpod
ToggleHabitActive toggleHabitActive(Ref ref) {
  return ToggleHabitActive(ref.read(habitRepositoryProvider));
}
