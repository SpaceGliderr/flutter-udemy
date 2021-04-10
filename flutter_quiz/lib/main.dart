import 'package:flutter/material.dart';
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

  void answerQuestion() {
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
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text("Answer 1"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text("Answer 2"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text("Answer 3"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
