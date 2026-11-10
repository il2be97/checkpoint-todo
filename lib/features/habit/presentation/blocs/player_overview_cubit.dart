import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/entities/player_overview.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_player_overview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_overview_state.dart';
part 'player_overview_cubit.freezed.dart';

class PlayerOverviewCubit extends Cubit<PlayerOverviewState> {
  PlayerOverviewCubit(this.loadPlayerOverview) : super(const .initial());

  final LoadPlayerOverview loadPlayerOverview;

  Future<void> load() async {
    emit(const .loading());

    final resp = await loadPlayerOverview(DateTime.now()).run();
    emit(
      resp.fold(
        (err) => .failed(err),
        (overview) => .loaded(overview: overview),
      ),
    );
  }
}
