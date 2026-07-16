import 'package:flutter/material.dart';
import 'couter_app_page.dart';
import 'dice.dart';
import 'listview.dart';
import 'word.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Words(),
      ),
    ),
  );
}
