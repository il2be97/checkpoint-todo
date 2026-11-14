import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/presentation/helpers/character_helper.dart';
import 'package:checkpoint/features/character/presentation/helpers/int_helper.dart';
import 'package:checkpoint/features/character/presentation/provider/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';

class CharacterCard extends ConsumerWidget {
  const CharacterCard({super.key});

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
                Expanded(flex: 2, child: SvgPicture.asset(character.icon)),
                const SizedBox(width: AppPaddings.s),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        character.levelDescription,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(character.name, style: textTheme.headlineSmall),
                      const SizedBox(height: AppPaddings.s),
                      Row(
                        children: List.generate(character.maxHealth.round(), (
                          index,
                        ) {
                          return Padding(
                            padding: const .symmetric(
                              horizontal: AppPaddings.xs,
                            ),
                            child: SvgPicture.asset(
                              AppIcons.heart,
                              colorFilter: ColorFilter.mode(
                                character.health > index
                                    ? Colors.red
                                    : Colors.grey,
                                .srcIn,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: AppPaddings.xs),
                      Text(
                        LocaleKeys.home_hp_status.tr(
                          namedArgs: {
                            'current': character.health.toInt().commaSeparated,
                            'max': character.maxHealth.toInt().toString(),
                          },
                        ),
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            // Level Part
            IntrinsicHeight(
              child: Row(
                spacing: AppPaddings.m,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Text(
                        LocaleKeys.home_total_streak.tr().toUpperCase(),
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: textTheme.labelSmall,
                          children: [
                            WidgetSpan(
                              child: SvgPicture.asset(
                                AppIcons.flame,
                                colorFilter: ColorFilter.mode(
                                  colorScheme.primary,
                                  .srcIn,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " ${character.streak.toString()} ",
                              style: textTheme.titleMedium,
                            ),
                            TextSpan(
                              text: character.streak == 0
                                  ? LocaleKeys.home_total_streak_begin.tr()
                                  : LocaleKeys.home_total_streak_on_fire.tr(),
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(character.currentExp.round().commaSeparated),
                            Text(
                              '/${LocaleKeys.home_exp.tr(namedArgs: {"exp": character.levelExp.commaSeparated})}',
                              style: textTheme.labelSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppPaddings.s),
                        LinearProgressIndicator(value: character.levelProgress),
                        const SizedBox(height: AppPaddings.s),
                        Text(
                          LocaleKeys.home_exp_to_next_level.tr(
                            namedArgs: {
                              "remain": character.remainExp.commaSeparated,
                              "level": character.nextLevel.commaSeparated,
                            },
                          ),
                          style: textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on Character {
  String get levelDescription {
    final cLevel = level.toString();
    return switch (tier) {
      .peasant => LocaleKeys.home_level_peasant.tr(
        namedArgs: {'level': cLevel},
      ),
      .ragged => LocaleKeys.home_level_ragged_knight.tr(
        namedArgs: {'level': cLevel},
      ),
      .steel => LocaleKeys.home_level_steel_knight.tr(
        namedArgs: {'level': cLevel},
      ),
      .veteran => LocaleKeys.home_level_veteran_paladin.tr(
        namedArgs: {'level': cLevel},
      ),
      .grandmaster => LocaleKeys.home_level_grandmaster.tr(
        namedArgs: {'level': cLevel},
      ),
    };
  }
}
