import 'package:flutter/material.dart';
import 'couter_app_page.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(title: Text("Counter App"),backgroundColor: Colors.blue,),
          body:  Counter(),
      ),
    ),
  );
}

