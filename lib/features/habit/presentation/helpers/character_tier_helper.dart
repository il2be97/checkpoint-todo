import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

extension CharacterTierX on CharacterTier {
  String get icon {
    return switch (this) {
      .peasant => AppIcons.peasant,
      .ragged => AppIcons.ragged,
      .steel => AppIcons.steel,
      .veteran => AppIcons.veteran,
      .grandmaster => AppIcons.grandmaster,
    };
  }

  String get relaxIcon {
    return switch (this) {
      .peasant => AppIcons.peasantCampfire,
      .ragged => AppIcons.raggedCampfire,
      .steel => AppIcons.steelCampfire,
      .veteran => AppIcons.veteranCampfire,
      .grandmaster => AppIcons.grandmasterCampfire,
    };
  }

  String get name {
    return switch (this) {
      .peasant => LocaleKeys.habit_options_character_peasant.tr(),
      .ragged => LocaleKeys.habit_options_character_ragged.tr(),
      .steel => LocaleKeys.habit_options_character_steel.tr(),
      .veteran => LocaleKeys.habit_options_character_veteran.tr(),
      .grandmaster => LocaleKeys.habit_options_character_grandmaster.tr(),
    };
  }

  String get description {
    return switch (this) {
      .peasant => LocaleKeys.habit_options_character_peasant_description.tr(),
      .ragged => LocaleKeys.habit_options_character_ragged_description.tr(),
      .steel => LocaleKeys.habit_options_character_steel_description.tr(),
      .veteran => LocaleKeys.habit_options_character_veteran_description.tr(),
      .grandmaster =>
        LocaleKeys.habit_options_character_grandmaster_description.tr(),
    };
  }
}
