import 'package:checkpoint/core/orchestrator/game_orchestrator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends ConsumerWidget {
  final StatefulNavigationShell shell;

  const DashboardPage(this.shell, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Start running game engine.
    ref.watch(gameOrchestratorProvider);
    return Scaffold(
      body: shell,
      bottomNavigationBar: Column(
        mainAxisSize: .min,
        children: [
          const Divider(),
          NavigationBar(
            selectedIndex: shell.currentIndex,
            onDestinationSelected: (index) => shell.goBranch(
              index,
              initialLocation: index == shell.currentIndex,
            ),
            destinations: [
              _Destination(icon: Icons.home, label: LocaleKeys.nav_home.tr()),
              _Destination(
                icon: Icons.list_outlined,
                label: LocaleKeys.nav_habits.tr(),
              ),
              const _Destination(icon: Icons.settings, label: 'Settings'),
            ],
          ),
        ],
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
