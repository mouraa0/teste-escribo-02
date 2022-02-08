import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isPlayerOneTurn;
  final bool hasWinner;

  const ButtonComponent(
      {Key? key, required this.onPressed, required this.isPlayerOneTurn, required this.hasWinner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width,
      height: 54,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isPlayerOneTurn && !hasWinner
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/gumball_icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox(width: 40),
            const Text(
              'Jogar!',
              style: TextStyle(
                fontFamily: 'CarterOne',
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            !isPlayerOneTurn && !hasWinner
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/darwin_icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox(width: 40),
          ],
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: !hasWinner ? isPlayerOneTurn ? Colors.blue : AppColorScheme.orange : AppColorScheme.purpleDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
