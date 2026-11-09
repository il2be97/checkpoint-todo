import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:fpdart/src/task_either.dart';

class PlayerRepository extends IPlayerRepository {
  @override
  TaskEither<Error, Player> loadPlayer() {
    // TODO: implement loadPlayer
    throw UnimplementedError();
  }
}
