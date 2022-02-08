class CobrasEscadas {
  String player;
  int position;
  bool winner;

  CobrasEscadas(this.player, this.position, this.winner);

  Object jogar(int dado1, int dado2, hasWinner) {
    int somaDados = dado1 + dado2;
    int newPosition = position + somaDados;
    Map escadaPos = CobrasEscadas.escadaPosition();
    Map cobraPos = CobrasEscadas.cobraPosition();

    if (hasWinner) {
      return 'O jogo acabou!';
    }

    if (newPosition > 100) {
      return {
        'status': 'exceeded',
        'frase': 'Jogador $player ultrapassou a casa 100 :(',
        'turn': player,
      };
    } if (newPosition == 100) {
      winner = true;
      hasWinner = true;
      position = newPosition;
      return {
        'status': 'winner',
        'frase': 'Jogador $player venceu!',
        'turn': player,
      };
    } else {
      if (escadaPos.containsKey(newPosition.toString())) {
        if (newPosition == escadaPos[newPosition.toString()]['top']) {
          position = newPosition;

          return {
            'status': 'normal',
            'frase': 'Jogador $player está na casa $position',
            'turn': player
          };
        }
        position = escadaPos[newPosition.toString()]['top'];

        return {
          'status': 'escada',
          'frase': 'Jogador $player subiu pela escada até a casa $position',
          'turn': player
        };
      }
      if (cobraPos.containsKey(newPosition.toString())) {
        if (newPosition == cobraPos[newPosition.toString()]['bottom']) {
          position = newPosition;

          return {
            'status': 'normal',
            'frase': 'Jogador $player está na casa $position',
            'turn': player
          };
        }
        position = cobraPos[newPosition.toString()]['bottom'];

        return {
          'status': 'escada',
          'frase': 'Jogador $player desceu pela cobra até a casa $position',
          'turn': player,
        };
      }
      position += somaDados;
      return {
        'status': 'normal',
        'frase': 'Jogador $player está na casa $position',
        'turn': player
      };
    }
  }

  static Map cobraPosition() {
    return {
      '16': {
        'top': 16,
        'bottom': 6,
      },
      '6': {
        'top': 16,
        'bottom': 6,
      },
      '49': {
        'top': 49,
        'bottom': 11,
      },
      '11': {
        'top': 49,
        'bottom': 11,
      },
      '46': {
        'top': 46,
        'bottom': 25,
      },
      '25': {
        'top': 46,
        'bottom': 25,
      },
      '62': {
        'top': 62,
        'bottom': 19,
      },
      '19': {
        'top': 62,
        'bottom': 19,
      },
      '74': {
        'top': 74,
        'bottom': 53,
      },
      '53': {
        'top': 74,
        'bottom': 53,
      },
      '64': {
        'top': 64,
        'bottom': 60,
      },
      '60': {
        'top': 64,
        'bottom': 60,
      },
      '89': {
        'top': 89,
        'bottom': 68,
      },
      '68': {
        'top': 89,
        'bottom': 68,
      },
      '95': {
        'top': 95,
        'bottom': 75,
      },
      '75': {
        'top': 95,
        'bottom': 75,
      },
      '99': {
        'top': 99,
        'bottom': 80,
      },
      '80': {
        'top': 99,
        'bottom': 80,
      },
      '92': {
        'top': 92,
        'bottom': 88,
      },
      '88': {
        'top': 92,
        'bottom': 88,
      },
    };
  }

  static Map escadaPosition() {
    return {
      '78': {
        'top': 98,
        'bottom': 78,
      },
      '98': {
        'top': 98,
        'bottom': 78,
      },
      '87': {
        'top': 94,
        'bottom': 87,
      },
      '94': {
        'top': 94,
        'bottom': 87,
      },
      '71': {
        'top': 91,
        'bottom': 71,
      },
      '91': {
        'top': 91,
        'bottom': 71,
      },
      '28': {
        'top': 84,
        'bottom': 28,
      },
      '84': {
        'top': 84,
        'bottom': 28,
      },
      '51': {
        'top': 67,
        'bottom': 51,
      },
      '67': {
        'top': 67,
        'bottom': 51,
      },
      '36': {
        'top': 44,
        'bottom': 36,
      },
      '44': {
        'top': 44,
        'bottom': 36,
      },
      '21': {
        'top': 42,
        'bottom': 21,
      },
      '42': {
        'top': 42,
        'bottom': 21,
      },
      '2': {
        'top': 38,
        'bottom': 2,
      },
      '38': {
        'top': 38,
        'bottom': 2,
      },
      '8': {
        'top': 31,
        'bottom': 8,
      },
      '31': {
        'top': 31,
        'bottom': 8,
      },
      '15': {
        'top': 26,
        'bottom': 15,
      },
      '26': {
        'top': 26,
        'bottom': 15,
      },
      '7': {
        'top': 14,
        'bottom': 7,
      },
      '14': {
        'top': 14,
        'bottom': 7,
      }
    };
  }
}
