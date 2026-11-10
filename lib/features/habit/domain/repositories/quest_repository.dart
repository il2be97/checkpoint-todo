import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:fpdart/fpdart.dart';

abstract class IQuestRepository {
  TaskEither<Error, List<Quest>> read(DateTime date);
  TaskEither<Error, List<Quest>> readActive();
  TaskEither<Error, List<Quest>> readArchived();
}
