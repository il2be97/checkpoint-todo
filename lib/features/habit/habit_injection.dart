import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/home_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHabit(GetIt sl) async {
  sl.registerFactory<LoadPlayer>(() => LoadPlayer());

  sl.registerFactory<HabitsCubit>(() => HabitsCubit());
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
