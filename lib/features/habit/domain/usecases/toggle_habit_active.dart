import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_habit_active.g.dart';

class ToggleHabitActive {
  final IHabitsRepository habitsRepository;

  ToggleHabitActive(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit, {required}) {
    return habitsRepository.update(
      habit.copyWith(isActiveToday: !habit.isActiveToday),
    );
  }
}

@riverpod
ToggleHabitActive toggleHabitActive(Ref ref) {
  return ToggleHabitActive(ref.read(habitRepositoryProvider));
}
