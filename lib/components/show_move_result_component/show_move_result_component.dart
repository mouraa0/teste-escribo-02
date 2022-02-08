import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowMoveResultComponent extends StatefulWidget {
  final int diceOne;
  final int diceTwo;
  final String player;

  const ShowMoveResultComponent({
    Key? key,
    required this.diceOne,
    required this.diceTwo,
    required this.player,
  }) : super(key: key);

  @override
  _ShowMoveResultComponentState createState() =>
      _ShowMoveResultComponentState();
}

class _ShowMoveResultComponentState extends State<ShowMoveResultComponent> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.player == '1' ? Colors.blue[300] : AppColorScheme.orange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Jogador ${widget.player}',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                diceImage(widget.diceOne.toString()),
                diceImage(widget.diceTwo.toString()),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Soma: ${widget.diceOne + widget.diceTwo}',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 18,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'CONTINUAR',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget diceImage(String diceResult) => SvgPicture.asset(
        'assets/icons/dice_$diceResult.svg',
        width: 100,
        height: 100,
      );
}
