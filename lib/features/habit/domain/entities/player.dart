import 'package:checkpoint/features/habit/domain/entities/player_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required int maxHealth,
    required int health,
    required String name,
    required PlayerProgress progress,
    required int streak,
  }) = _Player;

  factory Player.mock() {
    return _Player(
      maxHealth: 5,
      health: 3,
      streak: 1,
      name: '-',
      progress: PlayerProgress.mock(),
    );
  }
}
