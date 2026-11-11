part of 'active_habits_cubit.dart';

@freezed
class ActiveHabitsState with _$ActiveHabitsState {
  const ActiveHabitsState._();

  const factory ActiveHabitsState.initial() = _Initial;
  const factory ActiveHabitsState.loading() = _Loading;
  const factory ActiveHabitsState.loaded(List<Habit> habits) = _Loaded;
  const factory ActiveHabitsState.failed(Error err) = _Failed;
}

extension ActiveHabitsStateX on ActiveHabitsState {
  bool get isLoading => this is _Initial || this is _Loading;
  List<Habit> get uHabits => this is _Loaded ? (this as _Loaded).habits : [];
}
