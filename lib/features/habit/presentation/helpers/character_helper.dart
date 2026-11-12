import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/features/habit/presentation/helpers/character_tier_helper.dart';

extension CharacterX on Character {
  String get icon => tier.icon;
  String get relaxIcon => tier.relaxIcon;
}
