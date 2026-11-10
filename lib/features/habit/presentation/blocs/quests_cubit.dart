import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_quests.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quests_state.dart';
part 'quests_cubit.freezed.dart';

class QuestsCubit extends Cubit<QuestsState> {
  QuestsCubit(this.loadQuests) : super(const .initial());

  final LoadQuests loadQuests;

  Future<void> load() async {
    emit(const .loading());

    final resp = await loadQuests(DateTime.now()).run();
    emit(resp.fold((err) => .failed(err), (quests) => .loaded(quests)));
  }
}
