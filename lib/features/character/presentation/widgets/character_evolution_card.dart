import 'package:checkpoint/features/character/domain/entities/character.dart';
import 'package:checkpoint/features/character/presentation/helpers/character_tier_helper.dart';
import 'package:checkpoint/features/character/presentation/provider/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_svg_picture.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

class CharacterEvolutionCard extends ConsumerWidget {
  const CharacterEvolutionCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(characterProvider);
    final character = characterState.value ?? Character.mock();
    final nextTier = character.nextTier;
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    final String icon = nextTier != null ? nextTier.icon : character.tier.icon;
    final String title = nextTier != null
        ? LocaleKeys.home_evolution_next_title.tr()
        : LocaleKeys.home_evolution_max_title.tr();
    final String description = nextTier != null
        ? LocaleKeys.home_evolution_next_subtitle.tr(
            namedArgs: {
              "next_tier": nextTier.name,
              "level": nextTier.minLevel.toString(),
            },
          )
        : LocaleKeys.home_evolution_max_subtitle.tr();

    final Widget nextContent = nextTier != null
        ? Icon(Icons.chevron_right, color: colorScheme.primary)
        : Text(
            LocaleKeys.home_evolution_max_info.tr().toUpperCase(),
            style: textTheme.labelMedium?.copyWith(color: colorScheme.primary),
          );

    return Column(
      crossAxisAlignment: .start,
      spacing: AppPaddings.s,
      children: [
        Text(
          LocaleKeys.home_evolution_title.tr(),
          style: textTheme.titleSmall?.copyWith(color: colorScheme.onSurface),
        ),
        AppShimmer(
          isLoading: characterState.isLoading,
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed('evolution'),
            child: Card(
              color: colorScheme.surfaceContainer,
              child: Padding(
                padding: const .all(AppPaddings.m),
                child: Row(
                  spacing: AppPaddings.m,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      spacing: AppPaddings.s,
                      children: [
                        AppSvgPicture(icon, height: 51),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              title,
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              description,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    nextContent,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
