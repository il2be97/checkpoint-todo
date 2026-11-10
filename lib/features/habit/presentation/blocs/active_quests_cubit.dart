import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_active_quests.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_quests_state.dart';
part 'active_quests_cubit.freezed.dart';

class ActiveQuestsCubit extends Cubit<ActiveQuestsState> {
  ActiveQuestsCubit(this.loadActiveQuests) : super(const .initial());

  final LoadActiveQuests loadActiveQuests;

  Future<void> load() async {
    emit(const .loading());

    final resp = await loadActiveQuests().run();
    emit(resp.fold((err) => .failed(err), (quests) => .loaded(quests)));
  }
}
