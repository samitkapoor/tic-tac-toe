import 'package:flutter/material.dart';

import 'package:tictactoe/constants/colors.dart';

class GridButton extends StatelessWidget {
  const GridButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 36) / 3,
      width: (MediaQuery.of(context).size.width - 36) / 3,
      decoration: BoxDecoration(
        border: Border.all(
          color: gridColor,
          width: 3,
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
