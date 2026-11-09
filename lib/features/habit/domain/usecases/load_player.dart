import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:fpdart/fpdart.dart';

class LoadPlayer {
  TaskEither<Error, Player> call() {
    return TaskEither.right(Player.mock());
  }
}
