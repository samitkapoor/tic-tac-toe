import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/constants/about.dart';

import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/utils/logic.dart';
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
            ),
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
            Container(
              height: MediaQuery.of(context).size.width - 30,
              width: MediaQuery.of(context).size.width - 30,
              color: gridColor,
              child: Row(
                children: [
                  ...gameState.map(
                    (column) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.width - 30,
                        width: (MediaQuery.of(context).size.width - 30) / 3,
                        child: Column(
                          children: [
                            ...(column)
                                .map(
                                  (e) => Container(
                                    height: (MediaQuery.of(context).size.width -
                                            30) /
                                        3,
                                    width: (MediaQuery.of(context).size.width -
                                            30) /
                                        3,
                                    color: Colors.black,
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
