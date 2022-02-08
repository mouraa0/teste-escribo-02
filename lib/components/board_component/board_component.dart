import 'package:desafio_tecnico_escribo/components/board_component/components/square_component.dart';
import 'package:flutter/material.dart';

class BoardComponent extends StatefulWidget {
  final int playerOnePosition;
  final int playerTwoPosition;

  const BoardComponent(
      {Key? key,
      required this.playerOnePosition,
      required this.playerTwoPosition})
      : super(key: key);

  @override
  _BoardComponentState createState() => _BoardComponentState();
}

class _BoardComponentState extends State<BoardComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, crossAxisSpacing: 4, mainAxisSpacing: 4),
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return SquareComponent(
            squareNumber: index + 1,
            isPlayerOneInSquare: widget.playerOnePosition == index + 1,
            isPlayerTwoInSquare: widget.playerTwoPosition == index + 1,
          );
        },
      ),
    );
  }
}
