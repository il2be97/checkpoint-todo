import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_habits.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habits_state.dart';
part 'habits_cubit.freezed.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit(this.loadHabits) : super(const .initial());

  final LoadHabits loadHabits;

  Future<void> load() async {
    emit(const .loading());

    final resp = await loadHabits(DateTime.now()).run();
    emit(resp.fold((err) => .failed(err), (habits) => .loaded(habits)));
  }
}
