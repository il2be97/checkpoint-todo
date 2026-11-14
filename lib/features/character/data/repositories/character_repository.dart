import 'package:checkpoint/features/character/data/data_sources/local/local_character_data_source.dart';
import 'package:checkpoint/features/character/data/mappers/character_mapper.dart';
import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';

class CharacterRepository extends ICharacterRepository {
  final ILocalCharacterDataSource _dataSource;

  CharacterRepository({required this._dataSource});

  @override
  TaskEither<Error, Character?> read() {
    return TaskEither.tryCatch(
      () async {
        final dto = await _dataSource.read();
        return dto?.toEntity();
      },
      (err, stack) {
        return .new();
      },
    );
  }

  @override
  TaskEither<Error, Character> create(Character character) {
    return TaskEither.tryCatch(
      () async {
        await _dataSource.create(character.toDTO());
        return character;
      },
      (err, stack) {
        return .new();
      },
    );
  }
}
