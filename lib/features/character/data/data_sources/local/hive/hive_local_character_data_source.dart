import 'package:checkpoint/core/storage/hive/models/character_hive_model.dart';
import 'package:checkpoint/features/character/data/data_sources/local/hive/mapper/hive_character_mapper.dart';
import 'package:checkpoint/features/character/data/data_sources/local/local_character_data_source.dart';
import 'package:checkpoint/features/character/data/dtos/character_dto.dart';
import 'package:hive_ce/hive.dart';

class HiveLocalCharacterDataSource extends ILocalCharacterDataSource {
  static const String _characterKey = 'currentCharacter';

  Future<Box<CharacterHiveModel>> _getBox() async =>
      Hive.openBox<CharacterHiveModel>('characterBox');

  @override
  Future<CharacterDTO?> read() async {
    final box = await _getBox();
    return box.get(_characterKey)?.toDTO();
  }

  @override
  Future<void> create(CharacterDTO dto) async {
    final box = await _getBox();
    return await box.put(_characterKey, dto.toHive());
  }
}
