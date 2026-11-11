part of 'habits_cubit.dart';

@freezed
class HabitsState with _$HabitsState {
  const factory HabitsState.initial() = _Initial;
  const factory HabitsState.loading() = _Loading;
  const factory HabitsState.loaded(List<Habit> habits) = _Loaded;
  const factory HabitsState.failed(Error err) = _Failed;
}

extension HabitsStateX on HabitsState {
  bool get isLoading => this is _Initial || this is _Loading;

  List<Habit> get uHabit => this is _Loaded ? (this as _Loaded).habits : [];
}
