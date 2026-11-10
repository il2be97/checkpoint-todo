import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/repositories/quest_repository.dart';
import 'package:fpdart/fpdart.dart';

class QuestRepository extends IQuestRepository {
  @override
  TaskEither<Error, List<Quest>> read(DateTime date) {
    return .right([]);
  }
}
