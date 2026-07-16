import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  return const ColoredBox(
      color: Color(0xFF2B5748),
      child: Center(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
