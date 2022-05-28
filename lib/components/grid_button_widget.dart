import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/core/game_screen.dart';
import 'package:tictactoe/models/grid_button.dart';
import 'package:tictactoe/utils/logic.dart';

// ignore: must_be_immutable
class GridButtonWidget extends StatelessWidget {
  GridButtonWidget({
    required this.gameScreenKey,
    required this.gridButton,
    Key? key,
  }) : super(key: key);

  GlobalKey<GameScreenState> gameScreenKey;

  GridButton gridButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPlay(gridButton: gridButton, key: gameScreenKey);
      },
      child: Container(
        height: (MediaQuery.of(context).size.width - 36) / 3,
        width: (MediaQuery.of(context).size.width - 36) / 3,
        decoration: BoxDecoration(
          border: Border.all(
            color: gridColor,
            width: 3,
          ),
        ),
        alignment: Alignment.center,
        child: (gridButton.value == 0)
            ? null
            : (gridButton.value == 1)
                ? Text(
                    'X',
                    style: GoogleFonts.aBeeZee(color: crossColor, fontSize: 80),
                  )
                : Text(
                    'O',
                    style:
                        GoogleFonts.aBeeZee(color: circleColor, fontSize: 80),
                  ),
      ),
    );
  }
}
