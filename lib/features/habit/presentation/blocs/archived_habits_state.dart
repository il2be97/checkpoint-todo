part of 'archived_habits_cubit.dart';

@freezed
sealed class ArchivedHabitsState with _$ArchivedHabitsState {
  const ArchivedHabitsState._();

  const factory ArchivedHabitsState.initial() = _Initial;
  const factory ArchivedHabitsState.loading() = _Loading;
  const factory ArchivedHabitsState.loaded(List<Quest> quests) = _Loaded;
  const factory ArchivedHabitsState.failed(Error err) = _Failed;
}

extension ArchivedHabitsStateX on ArchivedHabitsState {
  bool get isLoading => this is _Initial || this is _Loading;
  List<Quest> get uQuest => this is _Loaded ? (this as _Loaded).quests : [];
}
