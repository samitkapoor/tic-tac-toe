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
        onPlay(
            gridButton: gridButton,
            gameScreenKey: gameScreenKey,
            context: context);
      },
      child: Container(
        height: (MediaQuery.of(context).size.width - 40) / 3,
        width: (MediaQuery.of(context).size.width - 40) / 3,
        decoration: BoxDecoration(
          border: Border.all(
            color: (gridButton.value == 1 ||
                    gridButton.value == 2 ||
                    gridButton.value == 0)
                ? gridColor
                : Colors.yellow,
            width: 5,
          ),
          color: (gridButton.value != 3 && gridButton.value != 4)
              ? Colors.transparent
              : Colors.yellow,
        ),
        alignment: Alignment.center,
        child: (gridButton.value == 0)
            ? null
            : (gridButton.value == 1 || gridButton.value == 3)
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
