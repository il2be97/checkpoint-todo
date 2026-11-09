import 'package:checkpoint/core/injection/injection.dart';
import 'package:checkpoint/features/dashboard/presentation/blocs/dashboard_cubit.dart';
import 'package:checkpoint/features/dashboard/presentation/blocs/dashboard_state.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  final StatefulNavigationShell shell;

  const DashboardPage(this.shell, {super.key});

  static Widget create(StatefulNavigationShell shell) {
    return BlocProvider(
      create: (context) => sl<DashboardCubit>(),
      child: DashboardPage(shell),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listener: (context, state) => shell.goBranch(
        state.unwrappedPage.index,
        initialLocation: state.unwrappedPage.index == shell.currentIndex,
      ),
      child: Scaffold(
        body: shell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: shell.currentIndex,
          onDestinationSelected: (index) =>
              context.read<DashboardCubit>().changePage(.fromInt(index)),
          destinations: [
            _Destination(icon: Icons.home, label: LocaleKeys.nav_home.tr()),
            _Destination(
              icon: Icons.list_outlined,
              label: LocaleKeys.nav_habits.tr(),
            ),
            // TODO: - Return back later
            // _Destination(icon: Icons.settings, label: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class _Destination extends StatelessWidget {
  const _Destination({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(icon: Icon(icon), label: label);
  }
}
