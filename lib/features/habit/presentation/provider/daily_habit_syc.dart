import 'package:checkpoint/features/habit/domain/entities/habit_sync_summary.dart';
import 'package:checkpoint/features/habit/domain/usecases/sync_habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'daily_habit_syc.g.dart';

@Riverpod(keepAlive: true)
Future<HabitSyncSummary> dailyHabitSync(Ref ref) async {
  final result = await ref
      .read(syncHabitsProvider)
      .call()
      .delay(const Duration(milliseconds: 300))
      .run();
  return result.fold((err) => throw err, (summary) => summary);
}
