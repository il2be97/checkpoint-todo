import 'package:checkpoint/features/habit/domain/entities/player_progress.dart';

class Player {
  final int maxHealth;
  final int health;
  final String name;
  final PlayerProgress progress;
  final int streak;

  Player({
    required this.maxHealth,
    required this.health,
    required this.name,
    required this.progress,
    required this.streak,
  });

  factory Player.mock() {
    return Player(
      maxHealth: 5,
      health: 3,
      streak: 1,
      name: '-',
      progress: PlayerProgress.mock(),
    );
  }
}
