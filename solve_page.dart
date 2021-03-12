import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

class SolvePage extends StatefulWidget {
  @override
  _SolvePageState createState() => _SolvePageState();
}

class _SolvePageState extends State<SolvePage> {
  final _questions = const [
    {
      'questionText': 'Q1. 철수는 영희와 밥을 먹었다.',
      'answers': [
        {'text': '철수는 영희를 좋아한다.', 'score': 10},
        {'text': '철수는 밥을 좋아한다.', 'score': 5},
        {'text': '철수는 시간이 많다.', 'score': 2},
        {'text': '철수는 많이 먹는다.', 'score': 1},
      ],
    },
    { 'questionText': 'Q2. 민수는 들판을 달렸다.',
      'answers': [
        {'text': '민수.', 'score': 10},
        {'text': '들판', 'score': 5},
        {'text': '달리다', 'score': 2},
        {'text': '푸른 하늘', 'score': 0},
      ],
    },

    { 'questionText': 'Q3. 희영이는 눈사람을 만들었다.',
      'answers': [
        {'text': '희영이', 'score': 10},
        {'text': '겨울', 'score': 5},
        {'text': '눈사람', 'score': 2},
        {'text': '추워', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex +1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length){
      print('We have more questions!');}
    else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('문제집이름'),
        ),
        body: ListView(
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    ' Q1.',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.all(30),
              child: _questionIndex < _questions.length
                  ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,)
                  :Result(_totalScore, _resetQuiz),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('뒤로가기'),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,);
  }
}
