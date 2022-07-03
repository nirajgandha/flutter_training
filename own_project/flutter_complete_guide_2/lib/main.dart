import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite movie?',
      'answers': [
        {'text': 'Iron man', 'score': 10},
        {'text': 'Kong', 'score': 5},
        {'text': 'Hacked', 'score': 3},
        {'text': 'DDLJ', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite language?',
      'answers': [
        {'text': 'C', 'score': 3},
        {'text': 'C++', 'score': 11},
        {'text': 'Java', 'score': 5},
        {'text': 'Kotlin', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'I', 'score': 1},
        {'text': 'Me', 'score': 1},
        {'text': 'Myself', 'score': 1},
        {'text': 'No One', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionList: _questions,
                questionsAnswer: _answerQuestion,
                indexOfQuestions: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
