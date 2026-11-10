part of 'archived_habits_cubit.dart';

@freezed
sealed class ArchivedHabitsState with _$ArchivedHabitsState {
  const ArchivedHabitsState._();

  const factory ArchivedHabitsState.initial() = ArchivedHabitsInitial;
  const factory ArchivedHabitsState.loading() = ArchivedHabitsLoading;
  const factory ArchivedHabitsState.loaded() = ArchivedHabitsLoaded;
  const factory ArchivedHabitsState.failed(Error err) = ArchivedHabitsFailed;
}
