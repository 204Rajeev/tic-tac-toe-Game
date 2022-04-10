import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class PlayerTurnStatus extends StatelessWidget {
  PlayerTurnStatus({
    Key? key,
    required this.playerNumber,
    required this.turnVerifier,
    required this.score1,
    required this.score2,
  }) : super(key: key);

  final int playerNumber;
  final int turnVerifier;
  final int score1;
  final int score2;
  @override
  Widget build(BuildContext context) {
    return playerNumber == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black,
                ),
                child: Center(
                  child: turnVerifier == 1
                      ? Text(
                          'Player $playerNumber',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        )
                      : GlowText(
                          'Player $playerNumber',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Score - $score1',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black,
                ),
                height: 40,
                width: 80,
                child: Center(
                  child: turnVerifier == 0
                      ? Text(
                          'Player $playerNumber',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        )
                      : GlowText(
                          'Player $playerNumber',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Score - $score2',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          );
  }
}
