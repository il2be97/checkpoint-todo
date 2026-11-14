import 'package:checkpoint/features/character/data/data_sources/local/hive/hive_local_character_data_source.dart';
import 'package:checkpoint/features/character/data/dtos/character_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_character_data_source.g.dart';

abstract class ILocalCharacterDataSource {
  Future<CharacterDTO?> read();
  Future<void> create(CharacterDTO dto);
}

@riverpod
ILocalCharacterDataSource localCharacterDataSource(Ref ref) {
  return HiveLocalCharacterDataSource();
}
