import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'archive_habit.g.dart';

class ArchiveHabit {
  final IHabitsRepository habitsRepository;

  ArchiveHabit(this.habitsRepository);

  TaskEither<Error, Habit> call(Habit habit) {
    return habitsRepository.update(habit.archive());
  }
}

@riverpod
ArchiveHabit archiveHabit(Ref ref) {
  return ArchiveHabit(ref.read(habitRepositoryProvider));
}
