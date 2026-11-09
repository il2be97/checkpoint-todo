class Player {
  final int maxHelath;
  final double health;
  final String name;
  final PlayerProgress progress;

  Player({
    required this.maxHelath,
    required this.health,
    required this.name,
    required this.progress,
  });

  factory Player.mock() {
    return Player(
      maxHelath: 5,
      health: 3,
      name: '-',
      progress: PlayerProgress.mock(),
    );
  }
}

class PlayerProgress {
  final double maxExp;
  final double currentExp;
  final int level;

  PlayerProgress({
    required this.maxExp,
    required this.currentExp,
    required this.level,
  });

  factory PlayerProgress.mock() {
    return PlayerProgress(maxExp: 1000, currentExp: 0, level: 1);
  }
}
