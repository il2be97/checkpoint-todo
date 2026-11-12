import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/create_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/delete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/mark_habit_as_done.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_active_state.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_archive_state.dart';
import 'package:checkpoint/features/habit/domain/usecases/update_habit.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'habits_state.dart';
part 'habits_cubit.freezed.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit(
    this._load,
    this._create,
    this._toggleActive,
    this._toggleArchive,
    this._update,
    this._delete,
    this._markAsDone,
  ) : super(const .initial());

  final LoadHabits _load;
  final CreateHabit _create;
  final ToggleHabitActiveState _toggleActive;
  final ToggleHabitArchiveState _toggleArchive;
  final UpdateHabit _update;
  final DeleteHabit _delete;
  final MarkHabitAsDone _markAsDone;

  List<Habit> get _habits => List.from(state.habits);

  Future<void> load() async {
    emit(.loading(_habits));
    final resp = await _load(DateTime.now()).run();
    emit(
      resp.fold((err) => .failed(err, _habits), (habits) => .loaded(habits)),
    );
  }

  Future<void> create(Habit habit) async {
    emit(.loading(_habits));
    final resp = await _create(habit).run();

    emit(
      resp.fold(
        (err) => .failed(err, _habits),
        (newHabit) => .loaded(_habits + [newHabit]),
      ),
    );
  }

  Future<void> toggleActiveState(Habit habit) async {
    emit(.loading(_habits));
    final resp = await _toggleActive.call(habit).run();
    emit(
      resp.fold(
        (err) => .failed(err, _habits),
        (newHabit) => .loaded([
          for (final h in _habits) h.id == newHabit.id ? newHabit : h,
        ]),
      ),
    );
  }

  Future<void> toggleArchiveState(Habit habit) async {
    emit(.loading(_habits));
    final resp = await _toggleArchive.call(habit).run();
    emit(
      resp.fold(
        (err) => .failed(err, _habits),
        (newHabit) => .loaded([
          for (final h in _habits) h.id == newHabit.id ? newHabit : h,
        ]),
      ),
    );
  }

  Future<void> update(Habit habit) async {
    emit(.loading(_habits));
    final resp = await _update.call(habit).run();
    emit(
      resp.fold(
        (err) => .failed(err, _habits),
        (newHabit) => .loaded([
          for (final h in _habits) h.id == newHabit.id ? newHabit : h,
        ]),
      ),
    );
  }

  Future<void> delete(Habit habit) async {
    emit(.loading(_habits));
    final resp = await _delete.call(habit).run();
    emit(
      resp.fold(
        (err) => .failed(err, _habits),
        (removed) =>
            .loaded(_habits.where((h) => h.id != removed?.id).toList()),
      ),
    );
  }

  Future<void> markAsDone(Habit habit) async {
    emit(.loading(_habits));
    final resp = await _markAsDone.call(habit).run();
    emit(
      resp.fold(
        (err) => .failed(err, _habits),
        (newHabit) => .loaded([
          for (final h in _habits) h.id == newHabit.id ? newHabit : h,
        ]),
      ),
    );
  }
}
