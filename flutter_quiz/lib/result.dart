import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultPhrase {
    String resultPhrase;

    if (score <= 15) {
      resultPhrase = "Not so similar interests";
    } else if (score < 30) {
      resultPhrase = "Similar interests";
    } else if (score == 30) {
      resultPhrase = "Exact same interests";
    } else {
      resultPhrase = "I have no clue what you like";
    }

    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text("Restart Quiz"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.red)),
          )
        ],
      ),
    );
  }
}
