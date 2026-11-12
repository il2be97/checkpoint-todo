import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_habit_archive.g.dart';

class ToggleHabitArchive {
  final IHabitsRepository habitsRepository;

  ToggleHabitArchive(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.update(
      habit.copyWith(
        archivedDate: habit.archivedDate == null ? DateTime.now() : null,
      ),
    );
  }
}

@riverpod
ToggleHabitArchive toggleHabitArchive(Ref ref) {
  return ToggleHabitArchive(ref.read(habitRepositoryProvider));
}
