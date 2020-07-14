// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    // throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 12,
        },
        {
          'text': 'Green',
          'score': 5,
        },
        {
          'text': 'Blue',
          'score': 7,
        }
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Lion',
          'score': 8,
        },
        {
          'text': 'Tiger',
          'score': 9,
        },
        {
          'text': 'Dog',
          'score': 6,
        },
        {
          'text': 'Horse',
          'score': 5,
        }
      ]
    },
    {
      'questionText': 'What\'s your favourite number',
      'answers': [
        {
          'text': '1',
          'score': 7,
        },
        {
          'text': '2',
          'score': 20,
        },
        {
          'text': '3',
          'score': 5,
        },
        {
          'text': '4',
          'score': 10,
        }
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
