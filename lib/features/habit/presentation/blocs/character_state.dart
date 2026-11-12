part of 'character_cubit.dart';

@freezed
sealed class CharacterState with _$CharacterState {
  const CharacterState._();

  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.loaded({required Character character}) = _Loaded;
  const factory CharacterState.failed(Error err) = _Failed;
}

extension CharacterStateX on CharacterState {
  bool get isLoading => this is _Initial || this is _Initial;
  Character get uCharacter =>
      this is _Loaded ? (this as _Loaded).character : Character.mock();
}
