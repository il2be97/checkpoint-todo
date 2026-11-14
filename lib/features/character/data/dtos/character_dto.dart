import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
abstract class CharacterDTO with _$CharacterDTO {
  const factory CharacterDTO({
    required double health,
    required String name,
    required int streak,
    required double totalExp,
    required String id,
  }) = _CharacterDTO;

  factory CharacterDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDTOFromJson(json);
}
