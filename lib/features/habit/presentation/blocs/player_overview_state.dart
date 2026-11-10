part of 'player_overview_cubit.dart';

@freezed
class PlayerOverviewState with _$PlayerOverviewState {
  const PlayerOverviewState._();

  const factory PlayerOverviewState.initial() = PlayerOverviewStateInitial;
  const factory PlayerOverviewState.loading() = PlayerOverviewStateLoading;
  const factory PlayerOverviewState.loaded({required PlayerOverview overview}) =
      PlayerOverviewStateLoaded;

  const factory PlayerOverviewState.failed(Error err) =
      PlayerOverviewStateFailed;
}

extension PlayerOverviewStateX on PlayerOverviewState {
  Player get uPlayer => this is PlayerOverviewStateLoaded
      ? (this as PlayerOverviewStateLoaded).overview.player
      : Player.mock();

  List<Quest> get uQuests => this is PlayerOverviewStateLoaded
      ? (this as PlayerOverviewStateLoaded).overview.quests
      : [];

  bool get isLoading =>
      this is PlayerOverviewStateInitial || this is PlayerOverviewStateLoading;
}
