import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> _scoreKeeper = [];

  void checkAnswer(bool userPickedanswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinishQuiz() == true) {
        Alert(
            context: context,
            title: 'Quiz Over',
            desc: 'You\'ve reached at the end of quiz',
            buttons: [
              DialogButton(
                  color: Colors.greenAccent,
                  child: Text('Reset'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ]).show();

        quizBrain.reset();
        _scoreKeeper = [];
      } else {
        if (userPickedanswer == correctAnswer) {
          print('user got it right');

          _scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          // _scoreKeeper.add(quizBrain.getCheckIcon());
        } else {
          print('user got it wrong');
          _scoreKeeper.add(Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.

                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: _scoreKeeper,
        )
      ],
    );
  }
}
