import 'package:checkpoint/features/habit/data/data_sources/local_player_data_source.dart';
import 'package:checkpoint/features/habit/data/mappers/player_mapper.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:fpdart/fpdart.dart';

class PlayerRepository extends IPlayerRepository {
  final ILocalPlayerDataSource _dataSource;

  PlayerRepository({required this._dataSource});

  @override
  TaskEither<Error, Player> read() {
    return TaskEither.tryCatch(
      () async {
        final dto = await _dataSource.read();
        return dto.toEntity();
      },
      (err, stack) {
        return .new();
      },
    );
  }
}
