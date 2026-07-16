import 'package:go_router/go_router.dart';
import 'package:project_one_folder/pages/homepage.dart';
import 'package:project_one_folder/pages/infopage.dart';
import 'package:project_one_folder/pages/profilepage.dart';
import 'routes.dart';
import 'package:project_one_folder/routes/shell.dart';
import 'package:flutter/material.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.info,
              builder: (context, state) => const InfoPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
