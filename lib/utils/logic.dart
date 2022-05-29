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
    {required GridButton gridButton,
    required GlobalKey<GameScreenState> gameScreenKey,
    required BuildContext context}) {
  if (result == Result.play) {
    int row = gridButton.row;
    int col = gridButton.column;

    //if the grid element has not been pressed before
    if (gameState[row][col].value == 0) {
      gameState[row][col].value = (currentTurn == Turn.playerOne) ? 1 : 2;

      // ignore: invalid_use_of_protected_member
      gameScreenKey.currentState!.setState(() {});
      switchTurn();
    }
  } else {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('GAME OVER'),
      ),
    );
  }
  result = didEnd();
  if (result == Result.playerOneWin) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Player 1 Wins!'),
      ),
    );
  } else if (result == Result.playerTwoWin) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Player 2 Wins!'),
      ),
    );
  } else if (result == Result.tie) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('It\'s a tie!'),
      ),
    );
  }
}

//method called when restart floating button is pressed
//resets all the value, so the game can be played again
void onRestart({required GlobalKey<GameScreenState> gameScreenKey}) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      gameState[i][j].value = 0;
    }
  }

  currentTurn = Turn.playerOne;
  result = Result.play;

  // ignore: invalid_use_of_protected_member
  gameScreenKey.currentState!.setState(() {});
}

//the method checks if the game has ended or not!
Result didEnd() {
  //left diagonal
  if (gameState[0][0].value == gameState[1][1].value &&
      gameState[1][1].value == gameState[2][2].value) {
    if (gameState[1][1].value == 1) {
      gameState[0][0].value = gameState[1][1].value = gameState[2][2].value = 3;
      return Result.playerOneWin;
    } else if (gameState[1][1].value == 2) {
      gameState[0][0].value = gameState[1][1].value = gameState[2][2].value = 4;
      return Result.playerTwoWin;
    }
  }
  //right diagonal
  if (gameState[0][2].value == gameState[1][1].value &&
      gameState[1][1].value == gameState[2][0].value) {
    if (gameState[1][1].value == 1) {
      gameState[0][2].value = gameState[1][1].value = gameState[2][0].value = 3;
      return Result.playerOneWin;
    } else if (gameState[1][1].value == 2) {
      gameState[0][2].value = gameState[1][1].value = gameState[2][0].value = 4;
      return Result.playerTwoWin;
    }
  }
  //top row
  if (gameState[0][0].value == gameState[0][1].value &&
      gameState[0][1].value == gameState[0][2].value) {
    if (gameState[0][1].value == 1) {
      gameState[0][0].value = gameState[0][1].value = gameState[0][2].value = 3;
      return Result.playerOneWin;
    } else if (gameState[0][1].value == 2) {
      gameState[0][0].value = gameState[0][1].value = gameState[0][2].value = 4;
      return Result.playerTwoWin;
    }
  }
  //middle row
  if (gameState[1][0].value == gameState[1][1].value &&
      gameState[1][1].value == gameState[1][2].value) {
    if (gameState[1][1].value == 1) {
      gameState[1][0].value = gameState[1][1].value = gameState[1][2].value = 3;
      return Result.playerOneWin;
    } else if (gameState[1][1].value == 2) {
      gameState[1][0].value = gameState[1][1].value = gameState[1][2].value = 4;
      return Result.playerTwoWin;
    }
  }
  //bottom row
  if (gameState[2][0].value == gameState[2][1].value &&
      gameState[2][1].value == gameState[2][2].value) {
    if (gameState[2][1].value == 1) {
      gameState[2][0].value = gameState[2][1].value = gameState[2][2].value = 3;
      return Result.playerOneWin;
    } else if (gameState[2][1].value == 2) {
      gameState[2][0].value = gameState[2][1].value = gameState[2][2].value = 4;
      return Result.playerTwoWin;
    }
  }
  //left column
  if (gameState[0][0].value == gameState[1][0].value &&
      gameState[1][0].value == gameState[2][0].value) {
    if (gameState[1][0].value == 1) {
      gameState[0][0].value = gameState[1][0].value = gameState[2][0].value = 3;
      return Result.playerOneWin;
    } else if (gameState[1][0].value == 2) {
      gameState[0][0].value = gameState[1][0].value = gameState[2][0].value = 4;
      return Result.playerTwoWin;
    }
  }
  //middle column
  if (gameState[0][1].value == gameState[1][1].value &&
      gameState[1][1].value == gameState[2][1].value) {
    if (gameState[1][1].value == 1) {
      gameState[0][1].value = gameState[1][1].value = gameState[2][1].value = 3;
      return Result.playerOneWin;
    } else if (gameState[1][1].value == 2) {
      gameState[0][1].value = gameState[1][1].value = gameState[2][1].value = 4;
      return Result.playerTwoWin;
    }
  }
  //right column
  if (gameState[0][2].value == gameState[1][2].value &&
      gameState[1][2].value == gameState[2][2].value) {
    if (gameState[1][2].value == 1) {
      gameState[0][2].value = gameState[1][2].value = gameState[2][2].value = 3;
      return Result.playerOneWin;
    } else if (gameState[1][2].value == 2) {
      gameState[0][2].value = gameState[1][2].value = gameState[2][2].value = 4;
      return Result.playerTwoWin;
    }
  }

  if (gameState[0][0].value != 0 &&
      gameState[0][1].value != 0 &&
      gameState[0][2].value != 0 &&
      gameState[1][0].value != 0 &&
      gameState[1][1].value != 0 &&
      gameState[1][2].value != 0 &&
      gameState[2][0].value != 0 &&
      gameState[2][1].value != 0 &&
      gameState[2][2].value != 0) {
    return Result.tie;
  }

  return Result.play;
}
