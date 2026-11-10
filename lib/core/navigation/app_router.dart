import 'package:checkpoint/features/dashboard/presentation/pages/dashboard_page.dart';
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
              builder: (context, state) => HomePage.create(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/habits',
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
