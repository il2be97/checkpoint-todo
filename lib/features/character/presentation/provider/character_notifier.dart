import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/domain/usecases/ensure_character.dart';
import 'package:checkpoint/features/character/domain/usecases/damage_character.dart';
import 'package:checkpoint/features/character/domain/usecases/reward_character.dart';
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
        .read(ensureCharacterProvider)
        .call()
        .delay(const Duration(seconds: 1))
        .run();

    return resp.fold((err) => throw err, (character) => character);
  }

  Future<void> damage(double damage) async {
    final resp = await ref
        .read(damageCharacterProvider)
        .call(damage)
        .delay(const Duration(seconds: 1))
        .run();

    return resp.fold((err) => throw err, (character) => character);
  }

  Future<void> reward(double exp, {double? healAmount}) async {
    final resp = await ref
        .read(rewardCharacterProvider)
        .call(exp, healAmount: healAmount)
        .delay(const Duration(seconds: 1))
        .run();

    return resp.fold((err) => throw err, (character) => character);
  }
}
