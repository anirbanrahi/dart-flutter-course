import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dart_flutter_course/constants.dart';
import 'package:dart_flutter_course/routes/destination.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: cBlack);
            }
            return const IconThemeData(color: cWhite);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            return const TextStyle(color: cWhite);
          }),
        ),
        child: NavigationBar(
          backgroundColor: cGreenLight,
          height: 70,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: destinations
              .map(
                (destination) => NavigationDestination(
                  icon: Icon(destination.icon),
                  label: destination.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
