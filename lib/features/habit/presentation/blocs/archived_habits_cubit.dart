import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archived_habits_state.dart';
part 'archived_habits_cubit.freezed.dart';

class ArchivedHabitsCubit extends Cubit<ArchivedHabitsState> {
  ArchivedHabitsCubit() : super(const .initial());

  Future<void> load() async {
    emit(const .loading());

    await Future.delayed(const Duration(seconds: 1));
    emit(const .loaded([]));
  }
}
