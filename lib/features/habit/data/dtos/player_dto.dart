import 'package:checkpoint/features/habit/data/dtos/player_progress_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_dto.freezed.dart';
part 'player_dto.g.dart';

@freezed
abstract class PlayerDTO with _$PlayerDTO {
  const factory PlayerDTO({
    required int maxHealth,
    required int health,
    required String name,
    required int streak,
    required PlayerProgressDTO progress,
  }) = _PlayerDTO;

  factory PlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$PlayerDTOFromJson(json);
}
