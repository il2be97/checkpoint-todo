import 'package:checkpoint/core/helpers/date_time_helper.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_sync_summary.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_habit.g.dart';

class SyncHabits {
  final IHabitsRepository habitsRepository;
  const SyncHabits(this.habitsRepository);

  TaskEither<Error, HabitSyncSummary> call({DateTime? date}) {
    return TaskEither.Do((run) async {
      final today = (date ?? DateTime.now()).dateOnly;
      final rawHabits = await run(habitsRepository.read());
      final summary = HabitSyncSummary.fromHabits(rawHabits, today);

      final changedHabits = <Habit>[
        for (int i = 0; i < rawHabits.length; i++)
          if (rawHabits[i] != summary.habits[i]) summary.habits[i],
      ];

      if (changedHabits.isNotEmpty) {
        await run(habitsRepository.updateAll(changedHabits));
      }

      return summary;
    });
  }
}

@riverpod
SyncHabits syncHabits(Ref ref) {
  return SyncHabits(ref.read(habitRepositoryProvider));
}
