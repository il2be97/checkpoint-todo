part of 'active_quests_cubit.dart';

@freezed
class ActiveQuestsState with _$ActiveQuestsState {
  const ActiveQuestsState._();

  const factory ActiveQuestsState.initial() = _Initial;
  const factory ActiveQuestsState.loading() = _Loading;
  const factory ActiveQuestsState.loaded(List<Quest> quests) = _Loaded;
  const factory ActiveQuestsState.failed(Error err) = _Failed;
}

extension ActiveQuestsStateX on ActiveQuestsState {
  bool get isLoading => this is _Initial || this is _Loading;
  List<Quest> get uQuest => this is _Loaded ? (this as _Loaded).quests : [];
}
