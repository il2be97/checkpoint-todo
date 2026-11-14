import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/features/habit/domain/entities/habit_icon.dart';

extension HabitIconX on HabitIcon {
  String get iconPath {
    return switch (this) {
      .book => AppIcons.book,
      .sport => AppIcons.sport,
      .coding => AppIcons.coding,
      .language => AppIcons.language,
      .heart => AppIcons.heart,
      .coffee => AppIcons.coffee,
    };
  }
}
