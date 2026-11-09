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
