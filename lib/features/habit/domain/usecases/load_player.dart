import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:fpdart/fpdart.dart';

class LoadPlayer {
  TaskEither<Error, Player> call() {
    return TaskEither.right(
      Player(maxHelath: 5, health: 3, name: 'Nova', level: 1),
    );
  }
}
