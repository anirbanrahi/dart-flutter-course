import 'package:flutter/material.dart';
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
