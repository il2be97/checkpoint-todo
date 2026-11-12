import 'package:checkpoint/features/habit/data/data_sources/local_character_data_source.dart';
import 'package:checkpoint/features/habit/data/mappers/player_mapper.dart';
import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/features/habit/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';

class CharacterRepository extends ICharacterRepository {
  final ILocalCharacterDataSource _dataSource;

  CharacterRepository({required this._dataSource});

  @override
  TaskEither<Error, Character> read() {
    return TaskEither.tryCatch(
      () async {
        final dto = await _dataSource.read();
        return dto.toEntity();
      },
      (err, stack) {
        return .new();
      },
    );
  }
}
