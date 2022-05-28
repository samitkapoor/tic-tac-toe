import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            EdgeInsets.fromLTRB(15, MediaQuery.of(context).padding.top, 15, 15),
        children: [
          Text(
            'Tic-Tac-Toe',
            style: GoogleFonts.epilogue(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
