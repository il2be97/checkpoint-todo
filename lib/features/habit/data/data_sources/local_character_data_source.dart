import 'package:checkpoint/features/habit/data/dtos/character_dto.dart';

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
