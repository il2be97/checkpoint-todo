import 'package:checkpoint/features/habit/data/data_sources/local_player_data_source.dart';
import 'package:checkpoint/features/habit/data/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/data/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/habits_repository.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_active_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_archived_habits.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:checkpoint/features/habit/presentation/blocs/active_habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/archived_habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHabit(GetIt sl) async {
  // Data Sources
  sl.registerFactory<ILocalPlayerDataSource>(() => LocalPlayerDataSource());

  // Repo
  sl.registerFactory<IHabitsRepository>(() => HabitsRepository());
  sl.registerFactory<IPlayerRepository>(
    () => PlayerRepository(dataSource: sl()),
  );

  // UseCases
  sl.registerFactory<LoadPlayer>(() => LoadPlayer(sl()));
  sl.registerFactory<LoadActiveHabits>(() => LoadActiveHabits(sl()));
  sl.registerFactory<LoadArchivedHabits>(() => LoadArchivedHabits(sl()));
  sl.registerFactory<LoadQuests>(() => LoadQuests(sl()));

  // Cubits
  sl.registerFactory<PlayerCubit>(() => PlayerCubit(sl()));
  sl.registerFactory<ActiveHabitsCubit>(() => ActiveHabitsCubit(sl()));
  sl.registerFactory<HabitsCubit>(() => HabitsCubit(sl()));
  sl.registerFactory<ArchivedHabitsCubit>(() => ArchivedHabitsCubit());
}
