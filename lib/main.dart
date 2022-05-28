import 'package:flutter/material.dart';

import 'package:tictactoe/core/game_screen.dart';

void main() {
  runApp(Tictactoe());
}

class Tictactoe extends StatelessWidget {
  Tictactoe({super.key});

  GlobalKey<GameScreenState> gameScreenKey = GlobalKey<GameScreenState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff342E37),
        primaryColor: const Color(0xffFA824C),
        colorScheme: const ColorScheme.dark(),
      ),
      home: GameScreen(gameScreenKey: gameScreenKey, key: gameScreenKey),
    );
  }
}
