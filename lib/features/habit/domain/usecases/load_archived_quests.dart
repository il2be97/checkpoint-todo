import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/repositories/quest_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadArchivedQuests {
  const LoadArchivedQuests(this.questRepository);
  final IQuestRepository questRepository;

  TaskEither<Error, List<Quest>> call() {
    return questRepository.readArchived();
  }
}
