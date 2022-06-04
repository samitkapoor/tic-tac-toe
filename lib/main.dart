import 'package:flutter/material.dart';

import 'package:tictactoe/core/game_screen.dart';

void main() {
  runApp(Tictactoe());
}

// ignore: must_be_immutable
class Tictactoe extends StatelessWidget {
  Tictactoe({super.key});

  GlobalKey<GameScreenState> gameScreenKey = GlobalKey<GameScreenState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff2D3047),
        primaryColor: Colors.white70,
        colorScheme: const ColorScheme.light(),
      ),
      home: GameScreen(gameScreenKey: gameScreenKey, key: gameScreenKey),
    );
  }
}
