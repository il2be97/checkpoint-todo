import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quests_state.dart';
part 'quests_cubit.freezed.dart';

class QuestsCubit extends Cubit<QuestsState> {
  QuestsCubit() : super(QuestsState.initial());
}
