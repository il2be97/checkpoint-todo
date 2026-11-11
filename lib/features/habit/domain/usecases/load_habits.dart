import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoadQuests {
  const LoadQuests(this.habitsRepository);
  final IHabitsRepository habitsRepository;

  TaskEither<Error, List<Habit>> call(DateTime date) {
    return habitsRepository.read(date);
  }
}
