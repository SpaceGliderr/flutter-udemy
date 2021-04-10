import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIdx = 0;
  var _totalScore = 0;

  final _questions = [
    {
      "questionText": "What is your favourite colour?",
      "answers": [
        {"text": "Red", "score": 10},
        {"text": "Green", "score": 5},
        {"text": "Blue", "score": 7}
      ]
    },
    {
      "questionText": "What is your favourite animal?",
      "answers": [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 8},
        {"text": "Parrot", "score": 5},
        {"text": "Lion", "score": 2}
      ]
    },
    {
      "questionText": "What is your favourite food?",
      "answers": [
        {"text": "Nasi Lemak", "score": 8},
        {"text": "Burgers", "score": 10}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIdx += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First App"),
        ),
        body: _questionIdx < _questions.length
            ? Quiz(_questions, _questionIdx, _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
