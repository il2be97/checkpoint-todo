import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_card.dart';
import 'package:checkpoint/core/presentation/widgets/app_pill.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/core/theme/color_scheme.dart';
import 'package:checkpoint/features/habit/domain/entities/character.dart';
import 'package:checkpoint/features/habit/domain/entities/habit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/character_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/habits_cubit.dart';
import 'package:checkpoint/features/habit/presentation/helpers/character_tier_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_colors_helper.dart';
import 'package:checkpoint/features/habit/presentation/helpers/habit_icons_helper.dart';
import 'package:checkpoint/core/presentation/widgets/app_svg_picture.dart';

import 'package:checkpoint/features/habit/presentation/widgets/empty_habits_card.dart';
import 'package:checkpoint/features/habit/presentation/widgets/character_card.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// MARK: - Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HabitsCubit>()..load()),
        BlocProvider(create: (context) => sl<CharacterCubit>()..load()),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(
            title: LocaleKeys.home_title.tr(),
            subtitle: LocaleKeys.home_subtitle.tr().toUpperCase(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.s)),
          const SliverPadding(
            padding: .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(child: CharacterCard()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
          const SliverPadding(
            padding: .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(child: _Habits()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),

          const SliverPadding(
            padding: .symmetric(horizontal: AppPaddings.m),
            sliver: SliverToBoxAdapter(child: _EvolutionCard()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppPaddings.l)),
        ],
      ),
    );
  }
}

// MARK: - Quests content
class _Habits extends StatelessWidget {
  const _Habits();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final habits = context.watch<HabitsCubit>().state.activeToday;
    return habits.isEmpty
        ? EmptyHabitsCard(
            type: .openHabbits,
            onPressed: () => GoRouter.of(context).go('/habits'),
          )
        : Column(
            spacing: AppPaddings.s,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    LocaleKeys.home_todays_missions.tr(),
                    style: TextTheme.of(context).titleLarge,
                  ),
                  Row(
                    spacing: AppPaddings.xs,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: colorScheme.positive,
                      ),
                      Text(
                        LocaleKeys.home_todays_completed_info.tr(
                          namedArgs: {
                            "completed": habits
                                .where((habit) => habit.done)
                                .length
                                .toString(),
                            "general": habits.length.toString(),
                          },
                        ),
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.positive,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ...habits.map((habit) => _HabitCell(habit)),
              if (habits.whereNot((habit) => habit.done).isNotEmpty)
                Row(
                  crossAxisAlignment: .center,
                  spacing: AppPaddings.s,
                  children: [
                    Icon(Icons.gpp_maybe_outlined, color: colorScheme.warning),
                    Text(
                      LocaleKeys.home_complete_hint.tr(),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
            ],
          );
  }
}

// MARK: - Quest Cell
class _HabitCell extends StatelessWidget {
  const _HabitCell(this.habit);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    return AppCard(
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            spacing: AppPaddings.m,
            children: [
              Row(
                spacing: AppPaddings.s,
                children: [
                  AppSvgPicture(
                    habit.icon.iconPath,
                    color: habit.color.foreground,
                    height: 13,
                  ),
                  Text(
                    habit.title,
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),

              Row(
                spacing: AppPaddings.s,
                children: [
                  Row(
                    children: [
                      const AppSvgPicture(
                        AppIcons.flame,
                        height: 24,
                        width: 22,
                      ),
                      Text(
                        habit.streak.toString(),
                        style: textTheme.headlineLarge?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(
                        " ${LocaleKeys.habits_active_cell_streak_days.tr()}",
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primaryText,
                        ),
                      ),
                    ],
                  ),

                  AppPill(
                    child: Row(
                      spacing: AppPaddings.xs,
                      children: [
                        const Icon(Icons.emoji_events_outlined, size: 13),
                        Text(
                          LocaleKeys.home_best_streak.tr(
                            namedArgs: {"streak": habit.bestStreak.toString()},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                spacing: AppPaddings.s,
                children: [
                  AppPill(
                    child: Text(
                      LocaleKeys.home_total_info.tr(
                        namedArgs: {"days": habit.total.toString()},
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                  Text(
                    LocaleKeys.home_exp_reward.tr(
                      namedArgs: {"exp": habit.exp.toString()},
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.textSubtle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            spacing: AppPaddings.xs,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  foregroundColor: habit.done
                      ? colorScheme.surface
                      : colorScheme.onSurfaceVariant,
                  backgroundColor: habit.done
                      ? colorScheme.positive
                      : colorScheme.surfaceContainerHighest,
                  side: habit.done
                      ? null
                      : BorderSide(color: colorScheme.textSubtle, width: 1.0),
                ),
                onPressed: () => context.read<HabitsCubit>().markAsDone(habit),
                icon: const Icon(Icons.check),
              ),
              Text(
                habit.done
                    ? LocaleKeys.home_done.tr()
                    : LocaleKeys.home_check_in.tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// MARK: - Evolution Card
class _EvolutionCard extends StatelessWidget {
  const _EvolutionCard();

  @override
  Widget build(BuildContext context) {
    final characterState = context.watch<CharacterCubit>().state;
    final character = characterState.uCharacter;
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
