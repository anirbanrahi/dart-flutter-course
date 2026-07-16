import 'package:flutter/material.dart';
import 'pages/counter_app_page.dart';
import 'pages/dice.dart';
import 'pages/listview.dart';
import 'pages/word.dart';
import 'routes/router.dart';
void main() {
  runApp(const Tutorial());
}

class Tutorial extends StatelessWidget {
  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
