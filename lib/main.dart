import 'package:flutter/material.dart';
import 'player_turn_status.dart';
import 'show_results.dart';

main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const routeName = 'main';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var strArr = List.filled(9, 'assets/images/nothings_.png', growable: false);

  final String O = 'assets/images/Obutton.png';
  //2
  final String X = 'assets/images/Xbutton.png';
  //1
  String nothing = 'assets/images/nothings_.png';
  //0
  var turnVerifier = 0;

  void toggleTurnsAndFillBox(int index) {
    setState(() {
      if (turnVerifier == 0 && strArr[index] == 'assets/images/nothings_.png') {
        strArr[index] = X;
        turnVerifier = 1;
      } else if (turnVerifier == 1 &&
          strArr[index] == 'assets/images/nothings_.png') {
        strArr[index] = O;
        turnVerifier = 0;
      }
    });
    checkWinner();
  }

  var result = -1;
  int count = 0;

  void checkWinner() {
    if (strArr[0] == strArr[1] && strArr[1] == strArr[2] && strArr[0] == X) {
      result = 1;
    } else if (strArr[0] == strArr[1] &&
        strArr[1] == strArr[2] &&
        strArr[0] == O) {
      result = 2;
    } else if (strArr[3] == strArr[4] &&
        strArr[4] == strArr[5] &&
        strArr[3] == X) {
      result = 1;
    } else if (strArr[3] == strArr[4] &&
        strArr[4] == strArr[5] &&
        strArr[3] == O) {
      result = 2;
    } else if (strArr[6] == strArr[7] &&
        strArr[7] == strArr[8] &&
        strArr[6] == X) {
      result = 1;
    } else if (strArr[6] == strArr[7] &&
        strArr[7] == strArr[8] &&
        strArr[6] == O) {
      result = 2;
    } else if (strArr[0] == strArr[3] &&
        strArr[3] == strArr[6] &&
        strArr[0] == X) {
      result = 1;
    } else if (strArr[0] == strArr[3] &&
        strArr[3] == strArr[6] &&
        strArr[0] == O) {
      result = 2;
    } else if (strArr[1] == strArr[4] &&
        strArr[4] == strArr[7] &&
        strArr[1] == X) {
      result = 1;
    } else if (strArr[1] == strArr[4] &&
        strArr[4] == strArr[7] &&
        strArr[1] == O) {
      result = 2;
    } else if (strArr[2] == strArr[5] &&
        strArr[5] == strArr[8] &&
        strArr[2] == X) {
      result = 1;
    } else if (strArr[2] == strArr[5] &&
        strArr[5] == strArr[8] &&
        strArr[2] == O) {
      result = 2;
    } else if (strArr[0] == strArr[4] &&
        strArr[4] == strArr[8] &&
        strArr[0] == X) {
      result = 1;
    } else if (strArr[0] == strArr[4] &&
        strArr[4] == strArr[8] &&
        strArr[0] == O) {
      result = 2;
    } else if (strArr[2] == strArr[4] &&
        strArr[4] == strArr[6] &&
        strArr[2] == X) {
      result = 1;
    } else if (strArr[2] == strArr[4] &&
        strArr[4] == strArr[6] &&
        strArr[2] == O) {
      result = 2;
    }

    for (int i = 0; i < 8; i++) {
      if (strArr[i] != 'assets/images/nothings_.png') {
        count++;
      }
    }
    if (count != 9) {
      count = 0;
    } else if (count == 9 && result != 1 && result != 2) {
      result = 0;
    }

    if (result != -1) {
      displayResults(result);
    }
  }

  var scorePlayer1 = 0;
  var scorePlayer2 = 0;

  void displayResults(int num) {
    if (num == 1) {
      scorePlayer1++;
    } else if (num == 2) {
      scorePlayer2++;
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ShowResults(resultStatus: num, clearData: clearData);
        });
  }

  void clearData() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        strArr[i] = 'assets/images/nothings_.png';
      }
    });
    result = -1;
    turnVerifier = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(244, 182, 105, 1),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromRGBO(253, 240, 223, 1)),
      ),
      title: 'Welcome to Flutter',
      home: Scaffold(
          backgroundColor: const Color.fromRGBO(253, 240, 223, 1),
          appBar: AppBar(
            title: const Text('welcome players'),
            backgroundColor: const Color.fromRGBO(244, 182, 105, 1),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 120,
              ),
              PlayerTurnStatus(
                playerNumber: 1,
                turnVerifier: turnVerifier,
                score1: scorePlayer1,
                score2: scorePlayer2,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 355,
                  child: GridView.count(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    toggleTurnsAndFillBox(index);
                                  },
                                  child: Card(
                                      color: const Color.fromRGBO(
                                          244, 182, 105, 1),
                                      margin: const EdgeInsets.all(4),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              image: AssetImage(strArr[index])),
                                        ),
                                      )))),
                        );
                      })),
                ),
              ),
              PlayerTurnStatus(
                playerNumber: 2,
                turnVerifier: turnVerifier,
                score1: scorePlayer1,
                score2: scorePlayer2,
              ),
            ]),
          )),
    );
  }
}
