import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';

class AlertComponent extends StatelessWidget {
  final Map playerInfo;
  final String newPosition;

  const AlertComponent(
      {Key? key, required this.playerInfo, required this.newPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: playerInfo['turn'] == '1'
              ? Colors.blue[300]
              : AppColorScheme.orange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Jogador ${playerInfo['turn']}',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: AppColorScheme.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/${playerInfo['turn'] == '1' ? 'gumball' : 'darwin'}_icon.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              playerInfo['frase'],
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Raleway',
                color: AppColorScheme.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'CONTINUAR',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: playerInfo['turn'] == '1'
                      ? AppColorScheme.orangeDark
                      : Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
