import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/constants/about.dart';

import 'package:tictactoe/constants/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
          15,
          MediaQuery.of(context).padding.top,
          15,
          15,
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15,
              child: Text(
                'Tic-Tac-Toe',
                style: GoogleFonts.epilogue(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.bold,
                  color: gridColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {
                  launchUrlString(aboutGameUrl);
                },
                tooltip: 'About',
                icon: Icon(Icons.info, size: 32, color: gridColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
