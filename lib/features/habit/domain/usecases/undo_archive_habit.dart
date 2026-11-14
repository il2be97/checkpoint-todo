import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'undo_archive_habit.g.dart';

class UndoArchiveHabit {
  final IHabitsRepository habitsRepository;

  UndoArchiveHabit(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.update(habit.unarchive());
  }
}

@riverpod
UndoArchiveHabit undoArchiveHabit(Ref ref) {
  return UndoArchiveHabit(ref.read(habitRepositoryProvider));
}
