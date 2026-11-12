import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:fpdart/fpdart.dart';

abstract class ICharacterRepository {
  TaskEither<Error, Character> read();
}
