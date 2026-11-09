import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded({required Player player}) = HomeLoaded;
  const factory HomeState.failed(Error err) = HomeFailed;
}

extension HomeStateX on HomeState {
  Player get unwrappedPlayer =>
      this is HomeLoaded ? (this as HomeLoaded).player : Player.mock();

  bool get isLoading => this is HomeInitial || this is HomeLoading;
}
