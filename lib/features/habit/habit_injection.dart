import 'package:checkpoint/features/habit/data/data_sources/local_player_data_source.dart';
import 'package:checkpoint/features/habit/data/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/data/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/usecases/create_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/delete_habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_active_state.dart';
import 'package:checkpoint/features/habit/domain/usecases/toggle_habit_archive_state.dart';
import 'package:checkpoint/features/habit/domain/usecases/update_habit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHabit(GetIt sl) async {
  // Data Sources
  sl.registerFactory<ILocalPlayerDataSource>(() => LocalPlayerDataSource());

  // Repo
  sl.registerCachedFactory<IHabitsRepository>(() => HabitsRepository());
  sl.registerCachedFactory<IPlayerRepository>(
    () => PlayerRepository(dataSource: sl()),
  );

  // UseCases
  sl.registerFactory<LoadPlayer>(() => LoadPlayer(sl()));
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

  // Cubits
  sl.registerFactory<PlayerCubit>(() => PlayerCubit(sl()));
  sl.registerCachedFactory<HabitsCubit>(
    () => HabitsCubit(sl(), sl(), sl(), sl(), sl(), sl()),
  );
}
