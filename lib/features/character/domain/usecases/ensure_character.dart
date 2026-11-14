import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ensure_character.g.dart';

class EnsureCharacter {
  const EnsureCharacter(this._characterRepository);

  final ICharacterRepository _characterRepository;

  TaskEither<Error, Character> call() {
    return .Do((run) async {
      final character = await run(_characterRepository.read());
      if (character != null) return character;

      return await run(_characterRepository.create(Character.create()));
    });
  }
}

@riverpod
EnsureCharacter ensutreCharacter(Ref ref) {
  final repository = ref.read(characterRepositoryProvider);
  return EnsureCharacter(repository);
}
