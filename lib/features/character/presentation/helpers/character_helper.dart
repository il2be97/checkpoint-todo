import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/presentation/helpers/character_tier_helper.dart';

extension CharacterX on Character {
  String get icon => tier.icon;
  String get relaxIcon => tier.relaxIcon;
}
