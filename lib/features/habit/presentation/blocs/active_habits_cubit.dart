import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_active_habits.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_habits_state.dart';
part 'active_habits_cubit.freezed.dart';

class ActiveHabitsCubit extends Cubit<ActiveHabitsState> {
  ActiveHabitsCubit(this.loadActiveHabits) : super(const .initial());

  final LoadActiveHabits loadActiveHabits;

  Future<void> load() async {
    emit(const .loading());

    final resp = await loadActiveHabits().run();
    emit(resp.fold((err) => .failed(err), (quests) => .loaded(quests)));
  }
}
