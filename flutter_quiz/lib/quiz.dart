import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIdx;
  final Function selectHandler;

  Quiz(this.questions, this.questionIdx, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIdx]['questionText']),
        ...(questions[questionIdx]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer["text"], () => selectHandler(answer["score"]));
        }).toList()
      ],
    );
  }
}
