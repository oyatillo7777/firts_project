import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      print("changing image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 107, 53, 218),
          Color.fromARGB(255, 85, 21, 157),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/Dice-$currentDiceRoll.png'),
              TextButton(
                onPressed: () => rollDice(),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.only(top: 20),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 28)),
                child: Text("Roll Dice",
                    style: TextStyle(color: Colors.white, fontSize: 28)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
