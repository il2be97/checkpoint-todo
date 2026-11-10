part of 'player_cubit.dart';

@freezed
sealed class PlayerState with _$PlayerState {
  const PlayerState._();

  const factory PlayerState.initial() = _Initial;
  const factory PlayerState.loading() = _Loading;
  const factory PlayerState.loaded({required Player player}) = _Loaded;
  const factory PlayerState.failed(Error err) = _Failed;
}

extension PlayerStateX on PlayerState {
  bool get isLoading => this is _Initial || this is _Initial;
  Player get uPlayer =>
      this is _Loaded ? (this as _Loaded).player : Player.mock();
}
