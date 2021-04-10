import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerButtonText;
  final Function selectHandler;

  Answer(this.answerButtonText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerButtonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
        ),
      ),
    );
  }
}
