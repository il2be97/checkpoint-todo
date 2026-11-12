import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/features/habit/presentation/blocs/character_cubit.dart';
import 'package:checkpoint/features/habit/presentation/helpers/character_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/character_tier_helper.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final characterState = context.watch<CharacterCubit>().state;
    final character = characterState.uCharacter;
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
                        children: List.generate(character.maxHealth, (index) {
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
                            'current': character.health.toString(),
                            'max': character.maxHealth.toString(),
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
                        style: textTheme.labelSmall,
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
                              text: LocaleKeys.home_total_streak_on_fire.tr(),
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
                            Text(character.progress.currentExpFormatted),
                            Text(
                              '/${LocaleKeys.home_exp.tr(namedArgs: {"exp": character.progress.maxExpFormatted})}',
                              style: textTheme.labelSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppPaddings.s),
                        LinearProgressIndicator(
                          value: character.progress.progress,
                        ),
                        const SizedBox(height: AppPaddings.s),
                        Text(
                          LocaleKeys.home_exp_to_next_level.tr(
                            namedArgs: {
                              "current": character.progress.remainProgress,
                              "level": character.progress.nextLevel.toString(),
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

extension on CharacterProgress {
  String get maxExpFormatted {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(maxExp);
  }

  String get currentExpFormatted {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(currentExp);
  }

  double get progress {
    return currentExp / maxExp;
  }

  String get remainProgress {
    return (maxExp - currentExp).toStringAsFixed(0);
  }

  int get nextLevel {
    return level + 1;
  }
}

extension on Character {
  String get levelDescription => switch (tier) {
    .peasant => LocaleKeys.home_level_peasant.tr(
      namedArgs: {'level': progress.level.toString()},
    ),
    .ragged => LocaleKeys.home_level_ragged_knight.tr(
      namedArgs: {'level': progress.level.toString()},
    ),
    .steel => LocaleKeys.home_level_steel_knight.tr(
      namedArgs: {'level': progress.level.toString()},
    ),
    .veteran => LocaleKeys.home_level_veteran_paladin.tr(
      namedArgs: {'level': progress.level.toString()},
    ),
    .grandmaster => LocaleKeys.home_level_grandmaster.tr(
      namedArgs: {'level': progress.level.toString()},
    ),
  };
}
