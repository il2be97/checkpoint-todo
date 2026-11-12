import 'package:checkpoint/features/habit/data/dtos/character_dto.dart';
import 'package:checkpoint/features/habit/domain/entities/character.dart';

extension CharacterMapper on Character {
  CharacterDTO toDTO() => CharacterDTO(
    maxHealth: maxHealth,
    health: health,
    name: name,
    streak: streak,
    progress: progress.toDTO(),
  );
}

extension CharacterDTOMapper on CharacterDTO {
  Character toEntity() => Character(
    maxHealth: maxHealth,
    health: health,
    streak: streak,
    name: name,
    progress: progress.toEntity(),
  );
}

extension CharacterProgressMapper on CharacterProgress {
  CharacterProgressDTO toDTO() => CharacterProgressDTO(
    maxExp: maxExp,
    currentExp: currentExp,
    level: level,
  );
}

extension CharacterProgressDTOMapper on CharacterProgressDTO {
  CharacterProgress toEntity() =>
      CharacterProgress(maxExp: maxExp, currentExp: currentExp, level: level);
}
