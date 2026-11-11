import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habits_state.dart';
part 'habits_cubit.freezed.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit(this.loadQuests) : super(const .initial());

  final LoadQuests loadQuests;

  Future<void> load() async {
    emit(const .loading());

    final resp = await loadQuests(DateTime.now()).run();
    emit(resp.fold((err) => .failed(err), (quests) => .loaded(quests)));
  }
}
