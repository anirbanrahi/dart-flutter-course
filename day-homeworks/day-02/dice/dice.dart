import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  Dice({super.key});

  @override
  State<Dice> createState() => _Dice();
}

class _Dice extends State<Dice> {
  final random = Random.secure();
  final dice = [
    'assets/images/d1.png',
    'assets/images/d2.png',
    'assets/images/d3.png',
    'assets/images/d4.png',
    'assets/images/d5.png',
    'assets/images/d6.png',
  ];

  int index1 = 0;
  int index2 = 0;
  int sum = 0;
  bool rolldice = true;
  bool reset = false;
  int target = 0;
  bool opponent = false;

  void roll() {
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      sum = index1 + index2 + 2;
      checkStatus();
    });
  }

  String status = "Roll the dice.";
  String player = 'Player 1';
  String playerpoint = 'Player 1: Point 0';
  String playertarget = "Player 2: Target ";

  void checkStatus() {
    if (opponent) {
      player = "Player 2";
      if (sum == 7) {
        playerpoint = 'Player 2: Point $sum';
        status = "$player have lost.";
        reset = true;
        rolldice = false;
      } else if (sum == target) {
        playerpoint = 'Player 2: Point $sum';
        status = "$player have won.";
        reset = true;
        rolldice = false;
      } else {
        playerpoint = 'Player 2: Point $sum';
      }
    } else {
      if (sum == 7 || sum == 11) {
        status = "$player have won.";
        playerpoint = 'Player 1: Point $sum';
        reset = true;
        rolldice = false;
      } else if (sum == 2 || sum == 3 || sum == 12) {
        status = "$player have lost.";
        playerpoint = 'Player 1: Point $sum';
        reset = true;
        rolldice = false;
      } else {
        playerpoint = 'Player 1: Point $sum';
        status = "Player-2: Target: $sum";
        target = sum;
        opponent = true;
      }
    }
  }

  void resetall() {
    setState(() {
      index1 = 0;
      index2 = 0;
      sum = 0;
      rolldice = true;
      reset = false;
      target = 0;
      opponent = false;
      status = "Roll the dice.";
      player = 'Player 1';
      playerpoint = 'Player 1: Point 0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(dice[index1], width: 100, height: 100),
                SizedBox(width: 20),
                Image.asset(dice[index2], width: 100, height: 100),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(1), child: Text(playerpoint)),
          Padding(padding: const EdgeInsets.all(1), child: Text(player)),
          Padding(padding: const EdgeInsets.all(1), child: Text(status)),
          if (rolldice)
            Column(
              children: [
                ElevatedButton(onPressed: roll, child: Text("Roll Dice")),
              ],
            ),
          if (reset)
            Column(
              children: [
                ElevatedButton(onPressed: resetall, child: Text("Reset")),
              ],
            ),
        ],
      ),
    );
  }
}
