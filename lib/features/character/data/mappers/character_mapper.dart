import 'package:checkpoint/features/character/data/dtos/character_dto.dart';
import 'package:checkpoint/features/character/domain/entities/character.dart';

extension CharacterMapper on Character {
  CharacterDTO toDTO() => CharacterDTO(
    health: health,
    name: name,
    streak: streak,
    id: id,
    totalExp: totalExp,
  );
}

extension CharacterDTOMapper on CharacterDTO {
  Character toEntity() => Character(
    health: health,
    streak: streak,
    name: name,
    id: id,
    totalExp: totalExp,
  );
}
