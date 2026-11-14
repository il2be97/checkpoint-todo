import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/character/presentation/widgets/character_info_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

class SettingsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return CustomScrollView(
      slivers: [
        // Header
        AppSliverAppBar(
          title: LocaleKeys.settings_title.tr(),
          subtitle: LocaleKeys.settings_subtitle.tr().toUpperCase(),
        ),

        // Character Card
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppPaddings.m),
          sliver: SliverToBoxAdapter(child: CharacterInfoCard()),
        ),

        // Remindes
        const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppPaddings.m),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  LocaleKeys.settings_reminders_title.tr().toUpperCase(),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.textMuted,
                  ),
                ),
                const SizedBox(height: AppPaddings.m),

                AppCard(
                  paddings: .zero,
                  child: Column(
                    children: [
                      // Daily Reminder
                      _SwitchCell(
                        title: LocaleKeys.settings_reminders_daily_title.tr(),
                        subtitle: LocaleKeys.settings_reminders_daily_subtitle
                            .tr(),
                        onChanged: (value) {},
                      ),

                      // Alert risk
                      _SwitchCell(
                        title: LocaleKeys.settings_reminders_hp_rist_title.tr(),
                        subtitle: LocaleKeys.settings_reminders_hp_rist_subtitle
                            .tr(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Support
        const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppPaddings.m),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  LocaleKeys.settings_reminders_title.tr().toUpperCase(),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.textMuted,
                  ),
                ),
                const SizedBox(height: AppPaddings.m),

                AppCard(
                  paddings: .zero,
                  child: Column(
                    children: [
                      // Help guide
                      _Cell(
                        title: LocaleKeys.settings_support_help_title.tr(),
                        onTap: () {},
                      ),

                      // Privacy Policy
                      _Cell(
                        title: LocaleKeys.settings_support_privacy_title.tr(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// MARK: - Switch Cell
class _SwitchCell extends StatelessWidget {
  const _SwitchCell({
    required this.title,
    this.subtitle,
    required this.onChanged,
  });

  final String title;
  final String? subtitle;
  final ValueSetter<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return SizedBox(
      height: 66,
      child: Padding(
        padding: const .symmetric(horizontal: AppPaddings.m),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.textMuted,
                    ),
                  ),
              ],
            ),
            Switch(value: false, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}

// MARK: -  Cell
class _Cell extends StatelessWidget {
  const _Cell({required this.title, required this.onTap});

  final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 66,
        child: Padding(
          padding: const .symmetric(horizontal: AppPaddings.m),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                title,
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
