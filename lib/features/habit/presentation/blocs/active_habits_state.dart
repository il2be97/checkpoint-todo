part of 'active_habits_cubit.dart';

@freezed
sealed class ActiveHabitsState with _$ActiveHabitsState {
  const ActiveHabitsState._();

  const factory ActiveHabitsState.initial() = ActiveHabitsInitial;
  const factory ActiveHabitsState.loading() = ActiveHabitsLoading;
  const factory ActiveHabitsState.loaded() = ActiveHabitsLoaded;
  const factory ActiveHabitsState.failed(Error err) = ActiveHabitsFailed;
}
