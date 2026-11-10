import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/repositories/quest_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadQuests {
  const LoadQuests(this.questRepository);
  final IQuestRepository questRepository;

  TaskEither<Error, List<Quest>> call(DateTime date) {
    return questRepository.read(date);
  }
}
