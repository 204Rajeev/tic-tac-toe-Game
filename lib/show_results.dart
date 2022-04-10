import 'package:flutter/material.dart';

class ShowResults extends StatelessWidget {
  const ShowResults(
      {Key? key, required this.resultStatus, required this.clearData})
      : super(key: key);
  static const routeName = '/ShowResult';
  final int resultStatus;
  final Function clearData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(253, 240, 223, 1),
      title: const Text('Congratulations!'),
      content: resultStatus != 0
          ? Text('player $resultStatus Won')
          : const Text('Draw'),
      actions: [
        TextButton(
            onPressed: () {
              clearData();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Play Again',
              style: TextStyle(
                color: Color.fromRGBO(244, 182, 105, 1),
              ),
            ))
      ],
    );
  }
}
