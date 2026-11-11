import 'dart:ui';

import 'package:checkpoint/features/habit/domain/entities/quest.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

extension HAbitColorsX on HabitColors {
  Color get background {
    return switch (this) {
      .lavender => const Color(0xFF302B40),
      .green => const Color(0xFF26382E),
      .orange => const Color(0xFF3D2E25),
      .blue => const Color(0xFF263344),
      .red => const Color(0xFF3D282D),
      .pink => const Color(0xFF3B2A38),
    };
  }

  Color get foreground {
    return switch (this) {
      .lavender => const Color(0xFFB69AFF),
      .green => const Color(0xFF8DDDAB),
      .orange => const Color(0xFFFFB078),
      .blue => const Color(0xFF91C5FF),
      .red => const Color(0xFFFF929B),
      .pink => const Color(0xFFF3A0D1),
    };
  }

  String get title {
    return switch (this) {
      .lavender => LocaleKeys.create_habit_colors_lavender.tr(),
      .green => LocaleKeys.create_habit_colors_green.tr(),
      .orange => LocaleKeys.create_habit_colors_orange.tr(),
      .blue => LocaleKeys.create_habit_colors_blue.tr(),
      .red => LocaleKeys.create_habit_colors_red.tr(),
      .pink => LocaleKeys.create_habit_colors_pink.tr(),
    };
  }
}
