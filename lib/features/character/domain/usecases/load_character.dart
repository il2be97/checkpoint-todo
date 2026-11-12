import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'load_character.g.dart';

class LoadCharacter {
  const LoadCharacter(this.characterRepository);

  final ICharacterRepository characterRepository;

  TaskEither<Error, Character> call() {
    return TaskEither.right(Character.mock());
  }
}

@riverpod
LoadCharacter loadCharacter(Ref ref) {
  final repository = ref.read(characterRepositoryProvider);
  return LoadCharacter(repository);
}
