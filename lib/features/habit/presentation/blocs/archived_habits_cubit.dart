import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archived_habits_state.dart';
part 'archived_habits_cubit.freezed.dart';

class ArchivedHabitsCubit extends Cubit<ArchivedHabitsState> {
  ArchivedHabitsCubit() : super(const .initial());
}
