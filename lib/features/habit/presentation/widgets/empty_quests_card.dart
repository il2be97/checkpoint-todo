import 'package:checkpoint/core/theme/app_decoration.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/player_progress.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum EmptyQuestsCardType { openHabbits, createHabit, archiveHabits }

class EmptyQuestsCard extends StatelessWidget {
  const EmptyQuestsCard({
    super.key,
    required this.type,
    required this.onPressed,
    required this.level,
  });

  final EmptyQuestsCardType type;
  final VoidCallback onPressed;
  final PlayerLevel level;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Container(
      decoration: AppDecoration.forCard(context),
      padding: const .all(AppPaddings.l),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        spacing: AppPaddings.m,
        children: [
          Center(child: SvgPicture.asset(level.iconPath)),
          Text(type.title, style: textTheme.headlineSmall, textAlign: .center),
          Text(type.subtitle, style: textTheme.bodySmall, textAlign: .center),
          FilledButton(onPressed: onPressed, child: Text(type.button)),
        ],
      ),
    );
  }
}

extension on EmptyQuestsCardType {
  String get title {
    switch (this) {
      case EmptyQuestsCardType.openHabbits:
        return LocaleKeys.empty_card_open_habits_title.tr();
      case EmptyQuestsCardType.createHabit:
        return LocaleKeys.empty_card_create_habits_title.tr();
      case EmptyQuestsCardType.archiveHabits:
        return LocaleKeys.empty_card_archive_habits_title.tr();
    }
  }

  String get subtitle {
    switch (this) {
      case EmptyQuestsCardType.openHabbits:
        return LocaleKeys.empty_card_open_habits_subtitle.tr();
      case EmptyQuestsCardType.createHabit:
        return LocaleKeys.empty_card_create_habits_subtitle.tr();
      case EmptyQuestsCardType.archiveHabits:
        return LocaleKeys.empty_card_archive_habits_subtitle.tr();
    }
  }

  String get button {
    switch (this) {
      case EmptyQuestsCardType.openHabbits:
        return LocaleKeys.empty_card_open_habits_button.tr();
      case EmptyQuestsCardType.createHabit:
        return LocaleKeys.empty_card_create_habits_button.tr();
      case EmptyQuestsCardType.archiveHabits:
        return LocaleKeys.empty_card_archive_habits_button.tr();
    }
  }
}

extension on PlayerLevel {
  String get iconPath {
    return switch (this) {
      PlayerLevel.peasant => AppIcons.peasantCampfire,

      PlayerLevel.ragged => AppIcons.raggedCampfire,

      PlayerLevel.steel => AppIcons.steelCampfire,

      PlayerLevel.veteran => AppIcons.veteran,

      PlayerLevel.grandmaster => AppIcons.grandmaster,
    };
  }
}
