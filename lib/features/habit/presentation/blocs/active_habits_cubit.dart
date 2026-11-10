import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_habits_state.dart';
part 'active_habits_cubit.freezed.dart';

class ActiveHabitsCubit extends Cubit<ActiveHabitsState> {
  ActiveHabitsCubit() : super(const .initial());
}
