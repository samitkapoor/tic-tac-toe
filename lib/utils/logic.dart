import 'package:flutter/material.dart';

import 'package:tictactoe/core/game_screen.dart';
import 'package:tictactoe/models/grid_button.dart';

enum Turn { playerOne, playerTwo }

enum Result { play, tie, playerOneWin, playerTwoWin }

List<List<GridButton>> gameState = [
  [
    GridButton(row: 0, column: 0, value: 0),
    GridButton(row: 0, column: 1, value: 0),
    GridButton(row: 0, column: 2, value: 0),
  ],
  [
    GridButton(row: 1, column: 0, value: 0),
    GridButton(row: 1, column: 1, value: 0),
    GridButton(row: 1, column: 2, value: 0),
  ],
  [
    GridButton(row: 2, column: 0, value: 0),
    GridButton(row: 2, column: 1, value: 0),
    GridButton(row: 2, column: 2, value: 0),
  ]
];

Turn currentTurn = Turn.playerOne;

Result result = Result.play;

void switchTurn() {
  currentTurn =
      (currentTurn == Turn.playerOne) ? Turn.playerTwo : Turn.playerOne;
}

void onPlay(
    {required GridButton gridButton, required GlobalKey<GameScreenState> key}) {
  int row = gridButton.row;
  int col = gridButton.column;

  gameState[row][col].value = (currentTurn == Turn.playerOne) ? 1 : 2;

  // ignore: invalid_use_of_protected_member
  key.currentState!.setState(() {});
  switchTurn();
}
