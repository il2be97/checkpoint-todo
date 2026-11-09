import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_progress_dto.freezed.dart';
part 'player_progress_dto.g.dart';

@freezed
abstract class PlayerProgressDTO with _$PlayerProgressDTO {
  const factory PlayerProgressDTO({
    required double maxExp,
    required double currentExp,
    required int level,
  }) = _PlayerProgressDTO;

  factory PlayerProgressDTO.fromJson(Map<String, dynamic> json) =>
      _$PlayerProgressDTOFromJson(json);
}
