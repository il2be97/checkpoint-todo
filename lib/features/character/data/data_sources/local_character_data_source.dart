import 'package:checkpoint/features/character/data/dtos/character_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_character_data_source.g.dart';

abstract class ILocalCharacterDataSource {
  Future<CharacterDTO> read();
}

class LocalCharacterDataSource extends ILocalCharacterDataSource {
  @override
  Future<CharacterDTO> read() async {
    return const CharacterDTO(
      maxHealth: 5,
      health: 5,
      name: 'ALOE',
      progress: CharacterProgressDTO(maxExp: 1000, currentExp: 0, level: 1),
      streak: 1,
    );
  }
}

@riverpod
ILocalCharacterDataSource localCharacterDataSource(Ref ref) {
  return LocalCharacterDataSource();
}
