import 'package:checkpoint/features/habit/data/dtos/player_dto.dart';
import 'package:checkpoint/features/habit/data/dtos/player_progress_dto.dart';

abstract class ILocalPlayerDataSource {
  Future<PlayerDTO> read();
}

class LocalPlayerDataSource extends ILocalPlayerDataSource {
  @override
  Future<PlayerDTO> read() async {
    return const PlayerDTO(
      maxHealth: 5,
      health: 5,
      name: 'ALOE',
      progress: PlayerProgressDTO(maxExp: 1000, currentExp: 0, level: 1),
      streak: 1,
    );
  }
}
