import 'package:checkpoint/features/habit/data/data_sources/local_player_data_source.dart';
import 'package:checkpoint/features/habit/data/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/data/repositories/quest_repository.dart';
import 'package:checkpoint/features/habit/domain/entities/player_overview.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/quest_repository.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player_overview.dart';
import 'package:checkpoint/features/habit/presentation/blocs/active_habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/archived_habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_overview_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHabit(GetIt sl) async {
  // Data Sources
  sl.registerFactory<ILocalPlayerDataSource>(() => LocalPlayerDataSource());

  // Repo
  sl.registerFactory<IQuestRepository>(() => QuestRepository());
  sl.registerFactory<IPlayerRepository>(
    () => PlayerRepository(dataSource: sl()),
  );

  // UseCases
  sl.registerFactory<LoadPlayer>(() => LoadPlayer());
  sl.registerFactory<LoadPlayerOverview>(
    () => LoadPlayerOverview(playerRepository: sl(), questRepository: sl()),
  );

  // Cubits
  sl.registerFactory<HabitsCubit>(() => HabitsCubit());
  sl.registerFactory<PlayerOverviewCubit>(() => PlayerOverviewCubit(sl()));
  sl.registerFactory<PlayerCubit>(() => PlayerCubit(sl()));
  sl.registerFactory<ActiveHabitsCubit>(() => ActiveHabitsCubit());
  sl.registerFactory<ArchivedHabitsCubit>(() => ArchivedHabitsCubit());
}
