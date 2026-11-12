import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required int maxHealth,
    required int health,
    required String name,
    required CharacterProgress progress,
    required int streak,
  }) = _Character;

  factory Character.mock() {
    return _Character(
      maxHealth: 5,
      health: 3,
      streak: 1,
      name: '-',
      progress: CharacterProgress.mock(),
    );
  }
}

@freezed
abstract class CharacterProgress with _$CharacterProgress {
  const factory CharacterProgress({
    required double maxExp,
    required double currentExp,
    required int level,
  }) = _CharacterProgress;

  factory CharacterProgress.mock() {
    return const _CharacterProgress(maxExp: 1000, currentExp: 0, level: 1);
  }
}

extension CharacterX on Character {
  CharacterTier get tier => CharacterTier.fromLevel(progress.level);
  CharacterTier? get nextTier => tier.next;
}

enum CharacterTier {
  peasant(minLevel: 1),
  ragged(minLevel: 5),
  steel(minLevel: 10),
  veteran(minLevel: 20),
  grandmaster(minLevel: 30);

  final int minLevel;

  const CharacterTier({required this.minLevel});

  CharacterTier? get next {
    final nextIndex = index + 1;
    return nextIndex < values.length ? values[nextIndex] : null;
  }

  int? get maxLevel => next != null ? next!.minLevel - 1 : null;

  static CharacterTier fromLevel(int level) {
    return values.lastWhere(
      (tier) => level >= tier.minLevel,
      orElse: () => values.first,
    );
  }

  bool get isFinal => this == .grandmaster;
}
