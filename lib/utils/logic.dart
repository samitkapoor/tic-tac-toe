enum Turn { playerOne, playerTwo }

enum Result { play, tie, playerOneWin, playerTwoWin }

List<Map<String, int>> gameState = [
  {'row': 0, 'col': 0, 'value': 0},
  {'row': 0, 'col': 1, 'value': 0},
  {'row': 0, 'col': 2, 'value': 0},
  {'row': 1, 'col': 0, 'value': 0},
  {'row': 1, 'col': 1, 'value': 0},
  {'row': 1, 'col': 2, 'value': 0},
  {'row': 2, 'col': 0, 'value': 0},
  {'row': 2, 'col': 1, 'value': 0},
  {'row': 2, 'col': 2, 'value': 0},
];

Turn currentTurn = Turn.playerOne;

Result result = Result.play;
