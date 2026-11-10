import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadPlayer {
  const LoadPlayer(this.playerRepository);
  final IPlayerRepository playerRepository;

  TaskEither<Error, Player> call() {
    return TaskEither.right(Player.mock());
  }
}
