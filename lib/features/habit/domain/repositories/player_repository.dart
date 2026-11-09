import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:fpdart/fpdart.dart';

abstract class IPlayerRepository {
  TaskEither<Error, Player> read();
}
