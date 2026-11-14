import 'package:checkpoint/features/character/domain/randomizer/character_name_generator.dart';
import 'package:checkpoint/features/character/domain/rules/level_progression.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v8.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required double health,
    required String name,
    required int streak,
    required double totalExp,
    required String id,
  }) = _Character;

  factory Character.create({String? name, String? id}) {
    final health = LevelProgression.getMaxHealth(1);

    return _Character(
      health: health.toDouble(),
      name: name ?? CharacterNameGenerator.generate(),
      id: id ?? const UuidV8().generate(),
      streak: 0,
      totalExp: 0,
    );
  }

  factory Character.mock() {
    return Character.create(name: '-');
  }
}

enum CharacterTier {
  peasant(minLevel: 1),
  ragged(minLevel: 5),
  steel(minLevel: 10),
  veteran(minLevel: 20),
  grandmaster(minLevel: 30);

  final int minLevel;

  const CharacterTier({required this.minLevel});

  static CharacterTier fromLevel(int level) {
    return values.lastWhere(
      (tier) => level >= tier.minLevel,
      orElse: () => values.first,
    );
  }

  CharacterTier? get next {
    final nextIndex = index + 1;
    return nextIndex < values.length ? values[nextIndex] : null;
  }

  int? get maxLevel => next != null ? next!.minLevel - 1 : null;

  bool get isFinal => this == .grandmaster;
}

extension CharacterX on Character {
  int get level => LevelProgression.getLevel(totalExp);
  int get nextLevel => level + 1;
  int get currentExp => LevelProgression.getCurrentExp(totalExp);
  int get levelExp => LevelProgression.getMaxExp(level);
  double get levelProgress => currentExp / levelExp;

  int get remainExp => levelExp - currentExp;
  int get maxHealth => LevelProgression.getMaxHealth(level);

  CharacterTier get tier => CharacterTier.fromLevel(level);
  CharacterTier? get nextTier => tier.next;
}
