import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
abstract class CharacterDTO with _$CharacterDTO {
  const factory CharacterDTO({
    required int maxHealth,
    required int health,
    required String name,
    required int streak,
    required CharacterProgressDTO progress,
  }) = _CharacterDTO;

  factory CharacterDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDTOFromJson(json);
}

@freezed
abstract class CharacterProgressDTO with _$CharacterProgressDTO {
  const factory CharacterProgressDTO({
    required double maxExp,
    required double currentExp,
    required int level,
  }) = _CharacterProgressDTO;

  factory CharacterProgressDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterProgressDTOFromJson(json);
}
