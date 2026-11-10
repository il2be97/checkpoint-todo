part of 'quests_cubit.dart';

@freezed
class QuestsState with _$QuestsState {
  const factory QuestsState.initial() = _Initial;
  const factory QuestsState.loading() = _Loading;
  const factory QuestsState.loaded(List<Quest> quests) = _Loaded;
  const factory QuestsState.failed(Error err) = _Failed;
}

extension QuestsStateX on QuestsState {
  bool get isLoading => this is _Initial || this is _Loading;

  List<Quest> get uQuest => this is _Loaded ? (this as _Loaded).quests : [];
}
