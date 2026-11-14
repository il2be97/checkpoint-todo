import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_habit.g.dart';

class UpdateHabit {
  final IHabitsRepository habitsRepository;

  UpdateHabit(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.update(habit);
  }
}

@riverpod
UpdateHabit updateHabit(Ref ref) {
  return UpdateHabit(ref.read(habitRepositoryProvider));
}
