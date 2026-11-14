import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/complete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/create_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/delete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_active.dart';
import 'package:checkpoint/features/habit/domain/usecases/archive_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/undo_archive_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/update_habit.dart';
import 'package:checkpoint/features/habit/presentation/provider/daily_habit_syc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habits_notifier.g.dart';

@riverpod
class HabitsNotifier extends _$HabitsNotifier {
  @override
  FutureOr<List<Habit>> build() async {
    final summary = await ref.watch(dailyHabitSyncProvider.future);
    return summary.habits;
  }

  List<Habit> get _currentHabits => state.value ?? [];

  Future<void> load() async {
    state = const .loading();

    final resp = await ref
        .read(loadHabitsProvider)
        .call()
        .delay(const Duration(milliseconds: 300))
        .run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (habits) => .data(habits),
    );
  }

  Future<void> create(Habit habit) async {
    state = const .loading();

    final createHabit = ref.read(createHabitProvider);
    final resp = await createHabit(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([..._currentHabits, newHabit]),
    );
  }

  Future<void> archive(Habit habit) async {
    state = const .loading();

    final resp = await ref.read(archiveHabitProvider).call(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([
        for (final h in _currentHabits) h.id == newHabit.id ? newHabit : h,
      ]),
    );
  }

  Future<void> undoArchive(Habit habit) async {
    state = const .loading();
    final resp = await ref.read(undoArchiveHabitProvider).call(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([
        for (final h in _currentHabits) h.id == newHabit.id ? newHabit : h,
      ]),
    );
  }

  Future<void> toggleActive(Habit habit) async {
    state = const .loading();
    final resp = await ref
        .read(toggleHabitActiveProvider)
        .call(habit, shouldPause: !habit.isPausedToday)
        .run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([
        for (final h in _currentHabits) h.id == newHabit.id ? newHabit : h,
      ]),
    );
  }

  Future<void> edit(Habit habit) async {
    state = const .loading();
    final resp = await ref.read(updateHabitProvider).call(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([
        for (final h in _currentHabits) h.id == newHabit.id ? newHabit : h,
      ]),
    );
  }

  Future<void> delete(Habit habit) async {
    state = const .loading();
    final resp = await ref.read(deleteHabitProvider).call(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (removed) =>
          .data(_currentHabits.where((h) => h.id != removed?.id).toList()),
    );
  }

  Future<void> complete(Habit habit) async {
    state = const .loading();

    final resp = await ref.read(completeHabitProvider).call(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([
        for (final h in _currentHabits) h.id == newHabit.id ? newHabit : h,
      ]),
    );
  }
}
