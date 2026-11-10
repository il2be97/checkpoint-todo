import 'package:checkpoint/features/habit/data/data_sources/local_player_data_source.dart';
import 'package:checkpoint/features/habit/data/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/data/repositories/quest_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/player_repository.dart';
import 'package:checkpoint/features/habit/domain/repositories/quest_repository.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_active_quests.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_archived_quests.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_quests.dart';
import 'package:checkpoint/features/habit/presentation/blocs/active_quests_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/archived_habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/player_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/quests_cubit.dart';
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
  sl.registerFactory<LoadPlayer>(() => LoadPlayer(sl()));
  sl.registerFactory<LoadActiveQuests>(() => LoadActiveQuests(sl()));
  sl.registerFactory<LoadArchivedQuests>(() => LoadArchivedQuests(sl()));
  sl.registerFactory<LoadQuests>(() => LoadQuests(sl()));

  // Cubits
  sl.registerFactory<PlayerCubit>(() => PlayerCubit(sl()));
  sl.registerFactory<ActiveQuestsCubit>(() => ActiveQuestsCubit(sl()));
  sl.registerFactory<QuestsCubit>(() => QuestsCubit());
  sl.registerFactory<ArchivedHabitsCubit>(() => ArchivedHabitsCubit());
}
