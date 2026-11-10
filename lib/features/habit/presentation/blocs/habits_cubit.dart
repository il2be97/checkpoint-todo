import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habits_state.dart';
part 'habits_cubit.freezed.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit() : super(const .initial());

  Future<void> load() async {}

  Future<void> changeTab(HabitTab tab) async {
    emit(HabitsState.loading(tab: tab));
  }
}
