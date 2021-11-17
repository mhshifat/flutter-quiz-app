import 'package:flutter/material.dart';

import './answares.dart';
import './quastion.dart';

class QuizManager extends StatefulWidget {
  const QuizManager({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizManagerState();
  }
}

class _QuizManagerState extends State<QuizManager> {
  final quastions = const [
    {
      "title": "Whats's your favourite color?",
      "answares": [
        {"text": "Black", "score": 5},
        {"text": "Blue", "score": 10},
        {"text": "Red", "score": 15},
        {"text": "Green", "score": 20},
      ]
    },
    {
      "title": "Whats's your favourite Food?",
      "answares": [
        {"text": "Rice", "score": 5},
        {"text": "Pizza", "score": 10},
        {"text": "Egg", "score": 15},
      ]
    },
    {
      "title": "Whats's your favourite sports?",
      "answares": [
        {"text": "Football", "score": 5},
        {"text": "Cricket", "score": 10},
        {"text": "Online Game", "score": 15},
      ]
    },
  ];

  var _currentQuestion = 0;
  var _finalScore = 0;
  var _finishAnswaringQuastions = false;

  void _answerQuastion(int score) {
    print(score);
    if (_currentQuestion < (quastions.length - 1)) {
      setState(() {
        _currentQuestion += 1;
        _finalScore += score;
      });
    } else {
      setState(() {
        _finishAnswaringQuastions = true;
      });
    }
  }

  void resetQuizs() {
    setState(() {
      _currentQuestion = 0;
      _finalScore = 0;
      _finishAnswaringQuastions = false;
    });
  }

  String get gameFinishedSpeach {
    if (_finalScore <= 10) {
      return "You are good!";
    } else if (_finalScore <= 20) {
      return "You are so so!";
    } else if (_finalScore <= 30) {
      return "Now, You have done it!";
    } else {
      return "You are a bad person!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return _finishAnswaringQuastions == false
        ? Column(
            children: [
              Quastion(quastions[_currentQuestion]['title'] as String),
              Answares(
                quastions[_currentQuestion]['answares']
                    as List<Map<String, Object>>,
                _answerQuastion,
              ),
            ],
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  gameFinishedSpeach,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextButton(
                  onPressed: resetQuizs,
                  child: const Text("Reset"),
                )
              ],
            ),
          );
  }
}
