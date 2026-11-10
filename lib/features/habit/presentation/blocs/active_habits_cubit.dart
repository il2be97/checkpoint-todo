import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/features/habit/presentation/blocs/active_quests_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_habits_state.dart';
part 'active_habits_cubit.freezed.dart';

class ActiveHabitsCubit extends Cubit<ActiveHabitsState> {
  ActiveHabitsCubit() : super(const .initial());

  Future<void> load() async {}
}
