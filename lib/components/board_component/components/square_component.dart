import 'package:desafio_tecnico_escribo/models/game_model.dart';
import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';

class SquareComponent extends StatefulWidget {
  final int squareNumber;
  final bool isPlayerOneInSquare;
  final bool isPlayerTwoInSquare;

  const SquareComponent(
      {Key? key,
      required this.squareNumber,
      required this.isPlayerOneInSquare,
      required this.isPlayerTwoInSquare})
      : super(key: key);

  @override
  _SquareComponentState createState() => _SquareComponentState();
}

class _SquareComponentState extends State<SquareComponent> {
  @override
  Widget build(BuildContext context) {
    bool _isPlayerInSquare =
        widget.isPlayerOneInSquare || widget.isPlayerTwoInSquare;
    bool _bothPlayersInSquare =
        widget.isPlayerOneInSquare && widget.isPlayerTwoInSquare;
    bool _isEscadaSquare;
    bool _isCobraSquare;
    Map _escadaPosition = CobrasEscadas.escadaPosition();
    Map _cobraPosition = CobrasEscadas.cobraPosition();

    _isEscadaSquare = _escadaPosition.containsKey(widget.squareNumber.toString());
    _isCobraSquare = _cobraPosition.containsKey(widget.squareNumber.toString());

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 20,
      height: 20,
      decoration: !_bothPlayersInSquare
          ? widget.isPlayerOneInSquare
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColorScheme.white,
                  border: Border.all(color: Colors.grey),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/gumball_icon.png'),
                      fit: BoxFit.cover),
                )
              : widget.isPlayerTwoInSquare
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorScheme.white,
                      border: Border.all(color: Colors.grey),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/darwin_icon.png'),
                          fit: BoxFit.cover),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorScheme.white,
                      border: Border.all(color: Colors.grey),
                    )
          : BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  AppColorScheme.orangeDark,
                ],
              ),
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(14),
            ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_isEscadaSquare && !_isPlayerInSquare)
            Image.asset(
              'assets/images/ladder_${_escadaPosition[widget.squareNumber.toString()]['top']}.png',
              fit: BoxFit.cover,
            ),
          if (_isCobraSquare && !_isPlayerInSquare)
            Image.asset(
              'assets/images/snake_${_cobraPosition[widget.squareNumber.toString()]['bottom']}.png',
              fit: BoxFit.cover,
            ),
          Visibility(
            visible: !_isPlayerInSquare,
            child: Text(
              widget.squareNumber.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'CarterOne',
              ),
            ),
          ),
        ],
      ),
    );
  }
}