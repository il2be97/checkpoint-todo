import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/presentation/blocs/character_cubit.dart';
import 'package:checkpoint/features/habit/presentation/helpers/character_helper.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

enum EmptyHabitsCardType { openHabbits, createHabit, archiveHabits }

class EmptyHabitsCard extends StatelessWidget {
  const EmptyHabitsCard({
    super.key,
    required this.type,
    required this.onPressed,
  });

  final EmptyHabitsCardType type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final character = context.watch<CharacterCubit>().state.uCharacter;
    final textTheme = TextTheme.of(context);
    return AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        spacing: AppPaddings.m,
        children: [
          Center(child: SvgPicture.asset(character.relaxIcon)),
          Text(type.title, style: textTheme.headlineSmall, textAlign: .center),
          Text(type.subtitle, style: textTheme.bodySmall, textAlign: .center),
          FilledButton(onPressed: onPressed, child: Text(type.button)),
        ],
      ),
    );
  }
}

extension on EmptyHabitsCardType {
  String get title {
    switch (this) {
      case EmptyHabitsCardType.openHabbits:
        return LocaleKeys.empty_card_open_habits_title.tr();
      case EmptyHabitsCardType.createHabit:
        return LocaleKeys.empty_card_create_habits_title.tr();
      case EmptyHabitsCardType.archiveHabits:
        return LocaleKeys.empty_card_archive_habits_title.tr();
    }
  }

  String get subtitle {
    switch (this) {
      case EmptyHabitsCardType.openHabbits:
        return LocaleKeys.empty_card_open_habits_subtitle.tr();
      case EmptyHabitsCardType.createHabit:
        return LocaleKeys.empty_card_create_habits_subtitle.tr();
      case EmptyHabitsCardType.archiveHabits:
        return LocaleKeys.empty_card_archive_habits_subtitle.tr();
    }
  }

  String get button {
    switch (this) {
      case EmptyHabitsCardType.openHabbits:
        return LocaleKeys.empty_card_open_habits_button.tr();
      case EmptyHabitsCardType.createHabit:
        return LocaleKeys.empty_card_create_habits_button.tr();
      case EmptyHabitsCardType.archiveHabits:
        return LocaleKeys.empty_card_archive_habits_button.tr();
    }
  }
}
