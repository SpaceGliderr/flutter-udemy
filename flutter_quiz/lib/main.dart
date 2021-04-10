import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIdx = 0;

  var question = [
    "Question 1",
    "Question 2",
  ];

  void _answerQuestion() {
    setState(() {
      _questionIdx += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First App"),
        ),
        body: Column(
          children: [
            Question(question[_questionIdx]),
            Answer("Answer 1", _answerQuestion),
            Answer("Answer 2", _answerQuestion),
            Answer("Answer 3", _answerQuestion),
          ],
        ),
      ),
    );
  }
}
