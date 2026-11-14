import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'load_habits.g.dart';

class LoadHabits {
  const LoadHabits(this.habitsRepository);
  final IHabitsRepository habitsRepository;

  TaskEither<Error, List<Habit>> call() {
    return habitsRepository.read();
  }
}

@riverpod
LoadHabits loadHabits(Ref ref) {
  return LoadHabits(ref.read(habitRepositoryProvider));
}
