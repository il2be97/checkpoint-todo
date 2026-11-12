import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/features/habit/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadCharacter {
  const LoadCharacter(this.characterRepository);
  final ICharacterRepository characterRepository;

  TaskEither<Error, Character> call() {
    return TaskEither.right(Character.mock());
  }
}
