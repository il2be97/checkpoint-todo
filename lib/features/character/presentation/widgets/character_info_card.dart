import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/presentation/helpers/character_helper.dart';
import 'package:checkpoint/features/character/presentation/helpers/int_helper.dart';
import 'package:checkpoint/features/character/presentation/provider/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';

class CharacterInfoCard extends ConsumerWidget {
  const CharacterInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(characterProvider);
    final character = characterState.value ?? Character.mock();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AppShimmer(
      isLoading: characterState.isLoading,
      child: AppCard(
        child: Column(
          spacing: AppPaddings.s,
          children: [
            // User Part
            Row(
              children: [
                Expanded(flex: 1, child: SvgPicture.asset(character.icon)),
                const SizedBox(width: AppPaddings.s),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: AppPaddings.xs,
                    children: [
                      Text(
                        character.name,
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        LocaleKeys.character_info_card_description.tr(
                          namedArgs: {
                            "level": character.level.commaSeparated,
                            "current_exp": character.currentExp.commaSeparated,
                            "new_level_exp": character.levelExp.commaSeparated,
                          },
                        ),
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.textSecondary,
                        ),
                      ),
                      Text(
                        LocaleKeys.character_info_card_moto.tr(),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
