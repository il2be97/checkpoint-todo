import 'package:checkpoint/features/habit/domain/entities/player_overview.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/quest_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadPlayerOverview {
  final IPlayerRepository playerRepository;
  final IQuestRepository questRepository;

  LoadPlayerOverview({
    required this.playerRepository,
    required this.questRepository,
  });

  TaskEither<Error, PlayerOverview> call(DateTime date) {
    return .Do((run) async {
      final player = await run(playerRepository.read());
      final quests = await run(questRepository.read(date));
      return PlayerOverview(quests: quests, player: player);
    });
  }
}
