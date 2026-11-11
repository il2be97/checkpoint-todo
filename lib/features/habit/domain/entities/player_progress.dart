import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_progress.freezed.dart';

@freezed
abstract class PlayerProgress with _$PlayerProgress {
  const factory PlayerProgress({
    required double maxExp,
    required double currentExp,
    required int level,
  }) = _PlayerProgress;

  factory PlayerProgress.mock() {
    return const _PlayerProgress(maxExp: 1000, currentExp: 0, level: 1);
  }
}

enum PlayerLevel { peasant, ragged, steel, veteran, grandmaster }

extension PlayerProgressX on PlayerProgress {
  PlayerLevel get levelType {
    return switch (level) {
      >= 1 && <= 3 => PlayerLevel.peasant,
      >= 4 && <= 7 => PlayerLevel.ragged,
      >= 8 && <= 12 => PlayerLevel.steel,
      >= 13 && <= 20 => PlayerLevel.veteran,
      >= 21 => PlayerLevel.grandmaster,
      _ => PlayerLevel.peasant,
    };
  }
}
