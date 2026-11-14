import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'complete_habit.g.dart';

class CompleteHabit {
  final IHabitsRepository habitsRepository;

  CompleteHabit(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.update(habit.complete());
  }
}

@riverpod
CompleteHabit completeHabit(Ref ref) {
  return CompleteHabit(ref.read(habitRepositoryProvider));
}
