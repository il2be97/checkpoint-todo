import 'package:checkpoint/features/habit/data/data_sources/local_character_data_source.dart';
import 'package:checkpoint/features/habit/data/repositories/character_repository.dart';
import 'package:checkpoint/features/habit/data/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/character_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/usecases/create_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/delete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_character.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/mark_habit_as_done.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_active_state.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_archive_state.dart';
import 'package:checkpoint/features/habit/domain/usecases/update_habit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/character_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHabit(GetIt sl) async {
  // Data Sources
  sl.registerFactory<ILocalCharacterDataSource>(
    () => LocalCharacterDataSource(),
  );

  // Repo
  sl.registerCachedFactory<IHabitsRepository>(() => HabitsRepository());
  sl.registerCachedFactory<ICharacterRepository>(
    () => CharacterRepository(dataSource: sl()),
  );

  // UseCases
  sl.registerFactory<LoadCharacter>(() => LoadCharacter(sl()));
  sl.registerFactory<LoadHabits>(() => LoadHabits(sl()));
  sl.registerFactory<CreateHabit>(() => CreateHabit(sl()));
  sl.registerFactory<ToggleHabitActiveState>(
    () => ToggleHabitActiveState(sl()),
  );
  sl.registerFactory<ToggleHabitArchiveState>(
    () => ToggleHabitArchiveState(sl()),
  );
  sl.registerFactory<UpdateHabit>(() => UpdateHabit(sl()));
  sl.registerFactory<DeleteHabit>(() => DeleteHabit(sl()));
  sl.registerFactory<MarkHabitAsDone>(() => MarkHabitAsDone(sl()));

  // Cubits
  sl.registerFactory<CharacterCubit>(() => CharacterCubit(sl()));
  sl.registerCachedFactory<HabitsCubit>(
    () => HabitsCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );
}
