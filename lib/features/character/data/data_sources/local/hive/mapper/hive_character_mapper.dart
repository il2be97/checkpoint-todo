import 'package:checkpoint/core/storage/hive/models/character_hive_model.dart';
import 'package:checkpoint/features/character/data/dtos/character_dto.dart';

extension CharacterDTOToHiveX on CharacterDTO {
  CharacterHiveModel toHive() => CharacterHiveModel(
    health: health,
    name: name,
    streak: streak,
    totalExp: totalExp,
    id: id,
  );
}

extension CharacterHiveToDTOX on CharacterHiveModel {
  CharacterDTO toDTO() => CharacterDTO(
    health: health,
    name: name,
    streak: streak,
    totalExp: totalExp,
    id: id,
  );
}
