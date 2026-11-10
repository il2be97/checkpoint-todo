import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';

class PlayerOverview {
  final List<Quest> quests;
  final Player player;

  PlayerOverview({required this.quests, required this.player});

  factory PlayerOverview.mock() {
    return PlayerOverview(quests: [], player: Player.mock());
  }
}
