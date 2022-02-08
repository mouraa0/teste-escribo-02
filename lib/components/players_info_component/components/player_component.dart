import 'package:desafio_tecnico_escribo/styles/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerComponent extends StatefulWidget {
  final bool isPlayerOne;
  final int playerPosition;

  const PlayerComponent(
      {Key? key, required this.isPlayerOne, required this.playerPosition})
      : super(key: key);

  @override
  _PlayerComponentState createState() => _PlayerComponentState();
}

class _PlayerComponentState extends State<PlayerComponent> {
  final TextStyle _textStyle = const TextStyle(
    fontFamily: 'Raleway',
    fontSize: 18,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> _playerInfoList = [
      icon(widget.isPlayerOne ? 'gumball' : 'darwin'),
      const SizedBox(width: 4),
      playerInfo(widget.playerPosition, widget.isPlayerOne ? '1' : '2')
    ];
    return Container(
      decoration: BoxDecoration(
          color: widget.isPlayerOne ? Colors.blue[200] : AppColorScheme.orange,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i in widget.isPlayerOne
              ? _playerInfoList
              : _playerInfoList.reversed.toList())
            i
        ],
      ),
    );
  }

  Widget icon(String name) => Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/${name}_icon.png'),
            fit: BoxFit.cover
          ),
        ),
      );

  Widget playerInfo(int playerPosition, String player) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Casa: ${playerPosition.toString()}',
            style: _textStyle,
          ),
          Text(
            'Jogador $player',
            style: _textStyle,
          )
        ],
      );
}
