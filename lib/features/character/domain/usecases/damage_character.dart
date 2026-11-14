import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/error/character_error.dart';
import 'package:checkpoint/features/character/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'damage_character.g.dart';

class DamageCharacter {
  final ICharacterRepository characterRepository;
  const DamageCharacter(this.characterRepository);

  TaskEither<Error, Character> call(double amount) {
    return TaskEither.Do((run) async {
      final nullableCharacter = await run(characterRepository.read());

      final character = await run(
        TaskEither.fromNullable(nullableCharacter, CharacterNotFoundError.new),
      );

      final newCharacter = character.changeHealth(amount);
      return await run(characterRepository.update(newCharacter));
    });
  }
}

@riverpod
DamageCharacter damageCharacter(Ref ref) {
  final repo = ref.read(characterRepositoryProvider);
  return DamageCharacter(repo);
}
