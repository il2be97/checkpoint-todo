import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/error/character_error.dart';
import 'package:checkpoint/features/character/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reward_character.g.dart';

class RewardCharacter {
  final ICharacterRepository characterRepository;
  const RewardCharacter(this.characterRepository);

  TaskEither<Error, Character> call(double exp, {double? healAmount}) {
    return TaskEither.Do((run) async {
      final nullableCharacter = await run(characterRepository.read());

      final character = await run(
        TaskEither.fromNullable(nullableCharacter, CharacterNotFoundError.new),
      );

      var updated = character.addExp(exp);
      if (healAmount != null) updated = updated.heal(healAmount);

      return await run(characterRepository.update(updated));
    });
  }
}

@riverpod
RewardCharacter rewardCharacter(Ref ref) {
  return RewardCharacter(ref.read(characterRepositoryProvider));
}
