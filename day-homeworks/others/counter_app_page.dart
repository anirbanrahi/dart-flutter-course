import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void _increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello"),
            Text('$count', style: const TextStyle(fontSize: 50)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increase,
        child: const Icon(Icons.add),
      ),
    );
  }
}
