import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.dart';
part 'player_cubit.freezed.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit(this.loadPlayer) : super(const PlayerState.initial());

  final LoadPlayer loadPlayer;

  Future<void> load() async {
    emit(const .loading());
    await Future.delayed(const Duration(seconds: 1));
    final resp = await loadPlayer().run();

    emit(resp.fold((err) => .failed(err), (player) => .loaded(player: player)));
  }
}
