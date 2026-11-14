import 'package:checkpoint/features/character/data/data_sources/local/local_character_data_source.dart';
import 'package:checkpoint/features/character/data/repositories/character_repository.dart';
import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_repository.g.dart';

abstract class ICharacterRepository {
  TaskEither<Error, Character?> read();
  TaskEither<Error, Character> create(Character character);
}

@riverpod
ICharacterRepository characterRepository(Ref ref) {
  return CharacterRepository(
    dataSource: ref.read(localCharacterDataSourceProvider),
  );
}
