import 'package:checkpoint/features/habit/data/dtos/player_dto.dart';
import 'package:checkpoint/features/habit/data/dtos/player_progress_dto.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/entities/player_progress.dart';

extension PlayerMapper on Player {
  PlayerDTO toDTO() => PlayerDTO(
    maxHealth: maxHealth,
    health: health,
    name: name,
    streak: streak,
    progress: progress.toDTO(),
  );
}

extension PlayerDTOMapper on PlayerDTO {
  Player toEntity() => Player(
    maxHealth: maxHealth,
    health: health,
    streak: streak,
    name: name,
    progress: progress.toEntity(),
  );
}

extension PlayerProgressMapper on PlayerProgress {
  PlayerProgressDTO toDTO() =>
      PlayerProgressDTO(maxExp: maxExp, currentExp: currentExp, level: level);
}

extension PlayerProgressDTOMapper on PlayerProgressDTO {
  PlayerProgress toEntity() =>
      PlayerProgress(maxExp: maxExp, currentExp: currentExp, level: level);
}
