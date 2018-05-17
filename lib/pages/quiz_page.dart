import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/question.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column( // this is our main Page
        children: <Widget>[
          new AnswerButton(true, () => print("true") ),
          new QuestionText("asdads", 1),
          new AnswerButton(false, () => print("false") )
        ],
        )
      ],
    );
  }
}