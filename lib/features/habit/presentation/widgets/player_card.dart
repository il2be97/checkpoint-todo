import 'package:checkpoint/core/theme/app_decoration.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/domain/entities/player_progress.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(this.player, {super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: const .only(
        left: AppPaddings.m,
        right: AppPaddings.m,
        bottom: AppPaddings.m,
      ),
      padding: const .all(AppPaddings.m),
      decoration: AppDecoration.forCard(context),
      child: Column(
        children: [
          // User Part
          Row(
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset(player.progress.iconPath),
              ),
              const SizedBox(width: AppPaddings.s),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      player.progress.levelDescription,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(player.name, style: textTheme.headlineSmall),
                    const SizedBox(height: AppPaddings.s),
                    Row(
                      children: List.generate(player.maxHealth, (index) {
                        return Padding(
                          padding: const .symmetric(horizontal: AppPaddings.xs),
                          child: SvgPicture.asset(
                            AppIcons.heart,
                            colorFilter: ColorFilter.mode(
                              player.health > index ? Colors.red : Colors.grey,
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
                          'current': player.health.toString(),
                          'max': player.maxHealth.toString(),
                        },
                      ),
                      style: textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: colorScheme.outlineVariant),
          // Level Part
          IntrinsicHeight(
            child: Row(
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
                            text: " ${player.streak.toString()} ",
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
                VerticalDivider(color: colorScheme.outlineVariant),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(player.progress.currentExpFormatted),
                          Text(
                            '/${LocaleKeys.home_exp.tr(namedArgs: {"exp": player.progress.maxExpFormatted})}',
                            style: textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppPaddings.s),
                      LinearProgressIndicator(value: player.progress.progress),
                      const SizedBox(height: AppPaddings.s),
                      Text(
                        LocaleKeys.home_exp_to_next_level.tr(
                          namedArgs: {
                            "current": player.progress.remainProgress,
                            "level": player.progress.nextLevel.toString(),
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
    );
  }
}

extension on PlayerProgress {
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

  String get levelDescription {
    return switch (levelType) {
      .peasant => LocaleKeys.home_level_peasant.tr(
        namedArgs: {'level': level.toString()},
      ),
      .ragged => LocaleKeys.home_level_ragged_knight.tr(
        namedArgs: {'level': level.toString()},
      ),
      .steel => LocaleKeys.home_level_steel_knight.tr(
        namedArgs: {'level': level.toString()},
      ),
      .veteran => LocaleKeys.home_level_veteran_paladin.tr(
        namedArgs: {'level': level.toString()},
      ),
      .grandmaster => LocaleKeys.home_level_grandmaster.tr(
        namedArgs: {'level': level.toString()},
      ),
    };
  }

  String get iconPath {
    return switch (levelType) {
      PlayerLevel.peasant => AppIcons.peasant,

      PlayerLevel.ragged => AppIcons.ragged,

      PlayerLevel.steel => AppIcons.steel,

      PlayerLevel.veteran => AppIcons.veteran,

      PlayerLevel.grandmaster => AppIcons.grandmaster,
    };
  }
}
