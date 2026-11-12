import 'package:bloc/bloc.dart';
import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/features/habit/domain/usecases/load_character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_state.dart';
part 'character_cubit.freezed.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.loadCharacter) : super(const CharacterState.initial());

  final LoadCharacter loadCharacter;

  Future<void> load() async {
    emit(const .loading());
    await Future.delayed(const Duration(seconds: 1));
    final resp = await loadCharacter().run();

    emit(
      resp.fold(
        (err) => .failed(err),
        (character) => .loaded(character: character),
      ),
    );
  }
}
