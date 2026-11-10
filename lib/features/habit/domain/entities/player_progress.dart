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

enum PlayerLevel { peasant, ragged, steel, veteran, grandmaster }

extension PlayerProgressX on PlayerProgress {
  PlayerLevel get levelType {
    return switch (level) {
      int l when l >= 1 && l <= 3 => .peasant,
      int l when l >= 4 && l <= 7 => .ragged,
      int l when l >= 8 && l <= 12 => .steel,
      int l when l >= 13 && l <= 20 => .veteran,
      int l when l >= 21 => .grandmaster,
      _ => .peasant,
    };
  }
}
