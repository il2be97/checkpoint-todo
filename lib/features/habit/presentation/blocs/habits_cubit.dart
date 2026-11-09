import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_state.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit() : super(const HabitsInitial());

  Future<void> load() async {}

  Future<void> changeTab(HabitTab tab) async {
    emit(HabitsState.loading(tab: tab));
  }
}
