import 'dart:math';
import 'package:desafio_tecnico_escribo/components/alert_component/alert_component.dart';
import 'package:desafio_tecnico_escribo/components/board_component/board_component.dart';
import 'package:desafio_tecnico_escribo/components/button_component/button_component.dart';
import 'package:desafio_tecnico_escribo/components/end_game_alert_component/end_game_alert_component.dart';
import 'package:desafio_tecnico_escribo/components/players_info_component/players_info_component.dart';
import 'package:desafio_tecnico_escribo/components/show_move_result_component/show_move_result_component.dart';
import 'package:desafio_tecnico_escribo/models/game_model.dart';
import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CobrasEscadas playerOne = CobrasEscadas('1', 0, false);
  CobrasEscadas playerTwo = CobrasEscadas('2', 0, false);
  String playerTurn = '1';
  List turnsInfo = [];

  @override
  Widget build(BuildContext context) {
    bool hasWinner = playerOne.winner || playerTwo.winner;

    return Scaffold(
      backgroundColor: AppColorScheme.purpleLight,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColorScheme.purpleDark,
        title: const Text(
          'Cobras e Escadas',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'CarterOne',
            color: AppColorScheme.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BoardComponent(
                playerOnePosition: playerOne.position,
                playerTwoPosition: playerTwo.position,
              ),
              const Spacer(flex: 3),
              ButtonComponent(
                hasWinner: hasWinner,
                onPressed: () async {
                  List<int> diceResults = rollDices();

                  if (hasWinner) {
                    return await showDialog(
                      context: context,
                      builder: (context) => const EndGameAlertComponent(),
                    );
                  }
                  if (playerTurn == '1') {
                    setState(() {
                      Object turnInfo = playerOne.jogar(
                        diceResults[0],
                        diceResults[1],
                        hasWinner
                      );
                      turnsInfo.add(turnInfo);
                    });
                    playerTurn = '2';
                  } else {
                    setState(() {
                      Object turnInfo = playerTwo.jogar(
                        diceResults[0],
                        diceResults[1],
                        hasWinner,
                      );
                      turnsInfo.add(turnInfo);
                    });
                    playerTurn = '1';
                  }
                  await showDialog(
                    context: context,
                    builder: (context) => ShowMoveResultComponent(
                      player: turnsInfo[turnsInfo.length - 1]['turn'],
                      diceOne: diceResults[0],
                      diceTwo: diceResults[1],
                    ),
                  );
                  if (turnsInfo[turnsInfo.length - 1]['status'] != 'normal') {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertComponent(
                        playerInfo: turnsInfo[turnsInfo.length - 1],
                        newPosition:
                            turnsInfo[turnsInfo.length - 1]['turn'] == '1'
                                ? playerOne.position.toString()
                                : playerTwo.position.toString(),
                      ),
                    );
                  }
                },
                isPlayerOneTurn: playerTurn == '1',
              ),
              const Spacer(flex: 1),
              PlayersInfoComponent(
                playerOnePosition: playerOne.position,
                playerTwoPosition: playerTwo.position,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<int> rollDices() {
    return [
      Random().nextInt(6) + 1,
      Random().nextInt(6) + 1,
    ];
  }
}
