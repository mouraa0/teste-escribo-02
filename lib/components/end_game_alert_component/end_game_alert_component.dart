import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';

class EndGameAlertComponent extends StatelessWidget {
  const EndGameAlertComponent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColorScheme.purpleLight,
        ),
        child: const Center(
          child: Text('O jogo acabou!',
            style: TextStyle(
              color: AppColorScheme.white,
              fontSize: 24,
              fontFamily: 'Raleway'
            ),
          ),
        ),
      ),
    );
  }
}
