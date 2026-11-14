import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/usecases/ensure_character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_notifier.g.dart';

@riverpod
class CharacterNotifier extends _$CharacterNotifier {
  @override
  FutureOr<Character> build() async {
    return _loadCharacter();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadCharacter());
  }

  Future<Character> _loadCharacter() async {
    final resp = await ref
        .read(ensutreCharacterProvider)
        .call()
        .delay(const Duration(seconds: 1))
        .run();

    return resp.fold((err) => throw err, (character) => character);
  }
}
