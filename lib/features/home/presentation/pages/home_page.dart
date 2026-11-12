import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/character/presentation/widgets/character_evolution_card.dart';
import 'package:checkpoint/features/character/presentation/widgets/character_card.dart';
import 'package:checkpoint/features/habit/presentation/widgets/daily_habits_section.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// MARK: - Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          AppSliverAppBar(
            title: LocaleKeys.home_title.tr(),
            subtitle: LocaleKeys.home_subtitle.tr().toUpperCase(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.s)),

          // Character Info
          const SliverPadding(
            padding: .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(child: CharacterCard()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),

          // Habits section
          const SliverPadding(
            padding: .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(child: DailyHabitsSection()),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),

          // Evolution Card
          const SliverPadding(
            padding: .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(child: CharacterEvolutionCard()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
        ],
      ),
    );
  }
}
