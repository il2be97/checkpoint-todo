part of 'player_cubit.dart';

@freezed
sealed class PlayerState with _$PlayerState {
  const PlayerState._();

  const factory PlayerState.initial() = PlayerInitial;

  const factory PlayerState.loading() = PlayerLoading;
  const factory PlayerState.loaded({required Player player}) = PlayerLoaded;
  const factory PlayerState.failed(Error err) = PlayerFailed;
}

extension PlayerStateX on PlayerState {
  Player get uPlayer =>
      this is PlayerLoaded ? (this as PlayerLoaded).player : Player.mock();

  bool get isLoading => this is PlayerInitial || this is PlayerLoading;
}
