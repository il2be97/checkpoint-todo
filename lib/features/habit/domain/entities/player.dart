class Player {
  final int maxHelath;
  final double health;
  final String name;
  final double level;

  Player({
    required this.maxHelath,
    required this.health,
    required this.name,
    required this.level,
  });

  factory Player.mock() {
    return Player(maxHelath: 5, health: 3, name: '-', level: 1);
  }
}
