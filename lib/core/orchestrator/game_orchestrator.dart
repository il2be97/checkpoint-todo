import 'package:checkpoint/core/balance/game_balance.dart';
import 'package:checkpoint/features/character/presentation/provider/character_notifier.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/presentation/provider/daily_habit_sync.dart';
import 'package:checkpoint/features/habit/presentation/provider/habits_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_orchestrator.g.dart';

@riverpod
class GameOrchestrator extends _$GameOrchestrator {
  @override
  void build() {
    ref.listen(dailyHabitSyncProvider, (previous, next) {
      if (previous?.value == next.value) return;

      next.whenData((summary) {
        if (summary.missedDays > 0) {
          final totalDamage =
              summary.missedDays * GameBalance.damagePerMissedDay;
          ref.read(characterProvider.notifier).damage(totalDamage);
        }
      });
    }, fireImmediately: true);

    ref.listen(habitsProvider, (previous, next) {
      final prevList = previous?.value;
      final nextList = next.value;
      if (prevList == null || nextList == null) return;

      _handleHabitStatusChange(prevList, nextList);
    });
  }

  void _handleHabitStatusChange(List<Habit> prevList, List<Habit> nextList) {
    final prevMap = {for (final h in prevList) h.id: h};

    for (final nextHabit in nextList) {
      final prevHabit = prevMap[nextHabit.id];
      if (prevHabit == null) continue;

      if (!prevHabit.isDoneToday && nextHabit.isDoneToday) {
        ref
            .read(characterProvider.notifier)
            .reward(nextHabit.exp, healAmount: GameBalance.healPerHabit);
      }
    }
  }
}
