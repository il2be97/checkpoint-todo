import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/complete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/create_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/delete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_active.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_archive.dart';
import 'package:checkpoint/features/habit/domain/usecases/update_habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habits_notifier.g.dart';

@riverpod
class HabitsNotifier extends _$HabitsNotifier {
  @override
  FutureOr<List<Habit>> build() async {
    return _loadHabits();
  }

  List<Habit> get _currentHabits => state.value ?? [];

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadHabits());
  }

  Future<List<Habit>> _loadHabits() async {
    final resp = await ref.read(loadHabitsProvider)(DateTime.now()).run();

    return resp.fold((err) => throw err, (habits) => habits);
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

  Future<void> toggleActive(Habit habit) async {
    state = const .loading();

    final resp = await ref.read(toggleHabitActiveProvider).call(habit).run();

    state = resp.fold(
      (err) => .error(err, StackTrace.current),
      (newHabit) => .data([
        for (final h in _currentHabits) h.id == newHabit.id ? newHabit : h,
      ]),
    );
  }

  Future<void> toggleArchive(Habit habit) async {
    state = const .loading();
    final resp = await ref.read(toggleHabitArchiveProvider).call(habit).run();

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
