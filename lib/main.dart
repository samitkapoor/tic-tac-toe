import 'package:flutter/material.dart';

import 'package:tictactoe/core/game_screen.dart';

void main() {
  runApp(const Tictactoe());
}

class Tictactoe extends StatelessWidget {
  const Tictactoe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff342E37),
        primaryColor: const Color(0xffFA824C),
        colorScheme: const ColorScheme.dark(),
      ),
      home: const GameScreen(),
    );
  }
}
