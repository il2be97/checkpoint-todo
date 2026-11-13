import 'package:checkpoint/features/character/presentation/provider/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/presentation/widgets/app_svg_picture.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/presentation/helpers/character_tier_helper.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

class CharacterEvolutionPage extends ConsumerWidget {
  const CharacterEvolutionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final characterState = ref.watch(characterProvider);
    final character = characterState.value ?? Character.mock();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(
            title: LocaleKeys.evolution_title.tr(),
            subtitle: LocaleKeys.evolution_subtitle.tr(),
          ),
          SliverPadding(
            padding: const .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(
              child: Text(
                LocaleKeys.evolution_tip.tr(),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.textMuted,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.s)),
          SliverPadding(
            padding: const .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: AppPaddings.s,
                children: CharacterTier.values
                    .map(
                      (tier) => _TierCell(
                        tier: tier,
                        type: _CellType.from(character.tier, tier),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
        ],
      ),
    );
  }
}

// MARK: - Cell
enum _CellType {
  unlocked,
  current,
  locked;

  static _CellType from(CharacterTier currentTier, CharacterTier comparedTier) {
    if (currentTier.index < comparedTier.index) {
      return .locked;
    } else if (currentTier.index == comparedTier.index) {
      return .current;
    } else {
      return .unlocked;
    }
  }
}

class _TierCell extends StatelessWidget {
  const _TierCell({required this.tier, required this.type});

  final CharacterTier tier;
  final _CellType type;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final Widget header = switch (type) {
      _CellType.unlocked => Text(
        LocaleKeys.evolution_unlocked
            .tr(
              namedArgs: {
                "min": tier.minLevel.toString(),
                "max": tier.maxLevel.toString(),
              },
            )
            .toUpperCase(),
        style: textTheme.labelSmall?.copyWith(
          color: colorScheme.onSuccessContainer,
        ),
      ),
      _CellType.current => Text(
        tier.isFinal
            ? LocaleKeys.evolution_max_current
                  .tr(namedArgs: {"lvl": tier.minLevel.toString()})
                  .toUpperCase()
            : LocaleKeys.evolution_current
                  .tr(
                    namedArgs: {
                      "min": tier.minLevel.toString(),
                      "max": tier.maxLevel.toString(),
                    },
                  )
                  .toUpperCase(),
        style: textTheme.labelSmall?.copyWith(
          color: colorScheme.onPrimaryContainer,
        ),
      ),

      _CellType.locked => Text(
        tier.isFinal
            ? LocaleKeys.evolution_max_locked
                  .tr(namedArgs: {"lvl": tier.minLevel.toString()})
                  .toUpperCase()
            : LocaleKeys.evolution_locked
                  .tr(
                    namedArgs: {
                      "min": tier.minLevel.toString(),
                      "max": tier.maxLevel.toString(),
                    },
                  )
                  .toUpperCase(),
        style: textTheme.labelSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    };

    return AppCard(
      child: Row(
        spacing: AppPaddings.m,
        children: [
          AppSvgPicture(tier.icon, height: 100),
          Column(
            spacing: AppPaddings.s,
            crossAxisAlignment: .start,
            children: [
              header,
              Text(
                tier.name,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                tier.description,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
