import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:checkpoint/features/habit/presentation/blocs/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.loadPlayer) : super(const HomeInitial());
  final LoadPlayer loadPlayer;

  Future<void> load() async {
    final result = await loadPlayer().run();
    await Future.delayed(const Duration(seconds: 1));
    final resp = result.fold(
      (error) => HomeFailed(error),
      (player) => HomeLoaded(player: player),
    );
    emit(resp);
  }
}
