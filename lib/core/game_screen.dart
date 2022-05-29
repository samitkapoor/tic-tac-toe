import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:tictactoe/components/grid_button_widget.dart';
import 'package:tictactoe/constants/about.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/utils/logic.dart';

class GameScreen extends StatefulWidget {
  GameScreen({required this.gameScreenKey, super.key});

  //this key will be used as a parameter for the helper functions to call setState from outside the class
  GlobalKey<GameScreenState> gameScreenKey;

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(15, MediaQuery.of(context).padding.top, 15, 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //full screen is the playground for the stack
            SizedBox(
              height: MediaQuery.of(context).size.height,
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
              top: 2,
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
              padding: const EdgeInsets.all(3),
              color: Colors.black,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...gameState.map(
                    (column) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.width - 36,
                        width: (MediaQuery.of(context).size.width - 36) / 3,
                        child: Column(
                          children: (column)
                              .map(
                                (gridButton) => GridButtonWidget(
                                  gridButton: gridButton,
                                  gameScreenKey: widget.gameScreenKey,
                                ),
                              )
                              .toList(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onRestart(gameScreenKey: widget.gameScreenKey);
        },
        tooltip: 'Restart game',
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.refresh, size: 30),
      ),
    );
  }
}
