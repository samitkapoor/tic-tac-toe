import 'package:flutter/material.dart';

import 'package:tictactoe/core/game_screen.dart';
import 'package:tictactoe/models/grid_button.dart';

enum Turn { playerOne, playerTwo }

//play : game hasn't ended yet
//tie : game has ended and no one won the game
//playerOneWin : game has ended and player one won the game
//playerTwoWin : game has ended and player two won the game
enum Result { play, tie, playerOneWin, playerTwoWin }

//this 2 dimensional List of GridButton will store the state of the grid at a particular instant
//that includes storing if the button is pressed or not, and if it is pressed then who pressed it player 1 or 2
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

//player 1 will always start the game
Turn currentTurn = Turn.playerOne;

Result result = Result.play;

void switchTurn() {
  currentTurn =
      (currentTurn == Turn.playerOne) ? Turn.playerTwo : Turn.playerOne;
}

//this function will be called everytime a button is pressed
void onPlay(
    {required GridButton gridButton, required GlobalKey<GameScreenState> key}) {
  int row = gridButton.row;
  int col = gridButton.column;

  gameState[row][col].value = (currentTurn == Turn.playerOne) ? 1 : 2;

  // ignore: invalid_use_of_protected_member
  key.currentState!.setState(() {});
  switchTurn();
}
