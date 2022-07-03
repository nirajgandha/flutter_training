import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final Function questionsAnswer;
  final int indexOfQuestions;

  Quiz({
    @required this.questionList,
    @required this.questionsAnswer,
    @required this.indexOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionList[indexOfQuestions]['questionText'],
        ),
        ...(questionList[indexOfQuestions]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => questionsAnswer(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
