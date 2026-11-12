part of 'habits_cubit.dart';

@freezed
abstract class HabitsState with _$HabitsState {
  const HabitsState._();

  const factory HabitsState.initial({@Default([]) List<Habit> habits}) =
      _Initial;
  const factory HabitsState.loading(List<Habit> habits) = _Loading;
  const factory HabitsState.loaded(List<Habit> habits) = _Loaded;
  const factory HabitsState.failed(Error err, List<Habit> habits) = _Failed;
}

extension HabitsStateX on HabitsState {
  bool get isInitialLoading {
    return this is _Initial || (this is _Loading && habits.isEmpty);
  }

  bool get isLoading {
    return this is _Loading;
  }

  List<Habit> get activeToday =>
      habits.where((habit) => habit.isActiveToday).toList();
  List<Habit> get activated =>
      habits.where((habit) => !habit.isArchived).toList();
  List<Habit> get archived =>
      habits.where((habit) => habit.isArchived).toList();
}
