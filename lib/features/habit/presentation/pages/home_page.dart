import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/core/presentation/widgets/app_shimmer.dart';
import 'package:checkpoint/core/presentation/widgets/app_sliver_app_bar.dart';
import 'package:checkpoint/core/theme/app_icons.dart';
import 'package:checkpoint/core/theme/app_paddings.dart';
import 'package:checkpoint/features/habit/domain/entities/player.dart';
import 'package:checkpoint/features/habit/presentation/blocs/home_cubit.dart';
import 'package:checkpoint/features/habit/presentation/blocs/home_state.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..load(),
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return AppShimmer(
            isLoading: state.isLoading,
            child: CustomScrollView(
              slivers: [
                AppSliverAppBar(
                  title: LocaleKeys.home_title.tr(),
                  subtitle: now.formatted.toUpperCase(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppPaddings.s),
                ),
                SliverToBoxAdapter(child: _PlayerCard(state.unwrappedPlayer)),
                const SliverFillRemaining(child: _Missions()),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PlayerCard extends StatelessWidget {
  const _PlayerCard(this.player);
  final Player player;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final levelDescription = switch (player.level.toInt()) {
      int l when l >= 1 && l <= 3 => LocaleKeys.home_level_beginner.tr(
        namedArgs: {'level': l.toString()},
      ),
      int l when l >= 4 && l <= 7 => LocaleKeys.home_level_explorer.tr(
        namedArgs: {'level': l.toString()},
      ),
      _ => LocaleKeys.home_unknown.tr(),
    };

    return Container(
      margin: const .only(
        left: AppPaddings.m,
        right: AppPaddings.m,
        bottom: AppPaddings.m,
      ),
      padding: const .all(AppPaddings.m),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: .circular(20),
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: SvgPicture.asset(AppIcons.player)),
              const SizedBox(width: AppPaddings.s),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      levelDescription,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(player.name, style: textTheme.headlineSmall),
                    const SizedBox(height: AppPaddings.s),
                    Row(
                      children: List.generate(player.maxHelath, (index) {
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
                          'max': player.maxHelath.toString(),
                        },
                      ),
                      style: textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Missions extends StatelessWidget {
  const _Missions();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.m),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                LocaleKeys.home_todays_missions.tr(),
                style: TextTheme.of(context).headlineSmall,
              ),
              Text('-', style: textTheme.labelSmall),
            ],
          ),
          const Expanded(child: Center(child: _Empty())),
        ],
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.home_empty.tr(),
      style: TextTheme.of(context).headlineMedium,
    );
  }
}

extension on DateTime {
  String get formatted {
    return DateFormat('EEEE, MMM d').format(this);
  }
}
