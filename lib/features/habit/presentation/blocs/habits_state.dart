import 'package:freezed_annotation/freezed_annotation.dart';

part 'habits_state.freezed.dart';

enum HabitTab { active, archived }

@freezed
sealed class HabitsState with _$HabitsState {
  const HabitsState._();

  const factory HabitsState.initial({@Default(HabitTab.active) HabitTab tab}) =
      HabitsInitial;

  const factory HabitsState.loading({required HabitTab tab}) = HabitsLoading;
  const factory HabitsState.loaded({required HabitTab tab}) = HabitsLoaded;

  const factory HabitsState.failed({
    required HabitTab tab,
    required Error err,
  }) = HabbitsFailed;
}

extension HabitsStateX on HabitsState {
  bool get isLoading => this is HabitsInitial || this is HabitsLoading;
}
