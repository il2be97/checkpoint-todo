import 'package:checkpoint/features/habit/data/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:fpdart/fpdart.dart';

class LoadPlayer {
  const LoadPlayer(this.playerRepository);
  final PlayerRepository playerRepository;

  TaskEither<Error, Player> call() {
    return TaskEither.right(Player.mock());
  }
}
