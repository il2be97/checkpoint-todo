import 'package:checkpoint/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:checkpoint/features/character/presentation/pages/character_evolution_page.dart';
import 'package:checkpoint/features/habit/presentation/pages/habits_page.dart';
import 'package:checkpoint/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => DashboardPage(shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: '/character-evolution',
                  name: 'character-evolution',
                  builder: (context, state) => const CharacterEvolutionPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/habits',
              name: 'habits',
              builder: (context, state) => const HabitsPage(),
            ),
          ],
        ),
        // TODO: - return back later.
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: '/settings',
        //       builder: (context, state) => Container(color: Colors.yellow),
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);
