class GridButton {
  int row;
  int column;
  //value == 0: if the button has not been pressed
  //value == 1: if the button was pressed by player 1
  //value == 2: if the button was pressed by player 2
  int value;

  GridButton({required this.row, required this.column, required this.value});
}
