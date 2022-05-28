import 'package:flutter/material.dart';

import 'package:tictactoe/views/game_screen.dart';

void main() {
  runApp(Tictactoe());
}

class Tictactoe extends StatelessWidget {
  const Tictactoe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff342E37),
        primaryColor: const Color(0xffFA824C),
        colorScheme: const ColorScheme.dark(),
      ),
      home: const GameScreen(),
    );
  }
}
