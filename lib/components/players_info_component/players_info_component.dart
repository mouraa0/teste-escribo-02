import 'package:desafio_tecnico_escribo/components/players_info_component/components/player_component.dart';
import 'package:flutter/material.dart';

class PlayersInfoComponent extends StatefulWidget {
  final int playerOnePosition;
  final int playerTwoPosition;

  const PlayersInfoComponent({
    Key? key,
    required this.playerOnePosition,
    required this.playerTwoPosition,
  }) : super(key: key);

  @override
  _PlayersInfoComponentState createState() => _PlayersInfoComponentState();
}

class _PlayersInfoComponentState extends State<PlayersInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlayerComponent(isPlayerOne: true, playerPosition: widget.playerOnePosition),
        PlayerComponent(isPlayerOne: false, playerPosition: widget.playerTwoPosition),
      ],
    );
  }
}
