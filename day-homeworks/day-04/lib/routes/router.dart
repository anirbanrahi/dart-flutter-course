import 'package:dart_flutter_course/models/contact_model.dart';
import 'package:dart_flutter_course/pages/contact_forms.dart';
import 'package:go_router/go_router.dart';
import 'package:dart_flutter_course/pages/contact_details.dart';
import 'package:dart_flutter_course/pages/homepage.dart';
import 'package:dart_flutter_course/pages/infopage.dart';
import 'package:dart_flutter_course/pages/profilepage.dart';
import 'routes.dart';
import 'package:dart_flutter_course/routes/shell.dart';
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
              name: Routes.home.name,
              path: Routes.home.path,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  name: Routes.contactDetails.name,
                  path: Routes.contactDetails.path,
                  builder: (context, state) {
                    final contact = state.extra as ContactModel;
                    return ContactDetailsPage(contact: contact);
                  },
                ),
                GoRoute(
                  name: Routes.contactForm.name,
                  path: Routes.contactForm.path,
                  builder: (context, state) {
                    return ContactFormPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.info.name,
              path: Routes.info.path,
              builder: (context, state) => const InfoPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.profile.name,
              path: Routes.profile.path,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
