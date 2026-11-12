import 'package:checkpoint/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:checkpoint/features/habit/presentation/pages/evolution_page.dart';
import 'package:checkpoint/features/habit/presentation/pages/habits_page.dart';
import 'package:checkpoint/features/habit/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => DashboardPage.create(shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => HomePage.create(),
              routes: [
                GoRoute(
                  path: '/evolution',
                  name: 'evolution',
                  builder: (context, state) => EvolutionPage.create(),
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
              builder: (context, state) => HabitsPage.create(),
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
