import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/presentation/helpers/character_helper.dart';
import 'package:checkpoint/features/character/presentation/provider/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';

class CharacterRelaxCard extends ConsumerWidget {
  const CharacterRelaxCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  final String buttonText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(characterProvider);
    final character = characterState.value ?? Character.mock();
    final textTheme = TextTheme.of(context);
    return AppCard(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        spacing: AppPaddings.m,
        children: [
          Center(child: SvgPicture.asset(character.relaxIcon)),
          Text(title, style: textTheme.headlineSmall, textAlign: .center),
          Text(subtitle, style: textTheme.bodySmall, textAlign: .center),
          FilledButton(onPressed: onPressed, child: Text(buttonText)),
        ],
      ),
    );
  }
}

// extension on EmptyHabitsCardType {
//   String get title {
//     switch (this) {
//       case EmptyHabitsCardType.openHabbits:
//         return LocaleKeys.empty_card_open_habits_title.tr();
//       case EmptyHabitsCardType.createHabit:
//         return LocaleKeys.empty_card_create_habits_title.tr();
//       case EmptyHabitsCardType.archiveHabits:
//         return LocaleKeys.empty_card_archive_habits_title.tr();
//     }
//   }

//   String get subtitle {
//     switch (this) {
//       case EmptyHabitsCardType.openHabbits:
//         return LocaleKeys.empty_card_open_habits_subtitle.tr();
//       case EmptyHabitsCardType.createHabit:
//         return LocaleKeys.empty_card_create_habits_subtitle.tr();
//       case EmptyHabitsCardType.archiveHabits:
//         return LocaleKeys.empty_card_archive_habits_subtitle.tr();
//     }
//   }

//   String get button {
//     switch (this) {
//       case EmptyHabitsCardType.openHabbits:
//         return LocaleKeys.empty_card_open_habits_button.tr();
//       case EmptyHabitsCardType.createHabit:
//         return LocaleKeys.empty_card_create_habits_button.tr();
//       case EmptyHabitsCardType.archiveHabits:
//         return LocaleKeys.empty_card_archive_habits_button.tr();
//     }
//   }
// }
