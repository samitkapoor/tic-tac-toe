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
      home: GameScreen(),
    );
  }
}
