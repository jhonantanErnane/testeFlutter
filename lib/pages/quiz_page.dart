import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import 'score_page.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human?", false),
    new Question("Pizza is healthy?", false),
    new Question("Flutter is awesome?", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorret;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer (bool answer) {
    isCorret = currentQuestion.answer == answer;
    quiz.answer(isCorret);
    this.setState( () {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // this is our main Page
        children: <Widget>[
          new AnswerButton(true, () => this.handleAnswer(true) ),
          new QuestionText(questionText, questionNumber),
          new AnswerButton(false, () => this.handleAnswer(false) )
        ],
        ),
        overlayShouldBeVisible ? new CorrectWrongOverlay(isCorret, () {
          currentQuestion = quiz.nextQuestion;
          this.setState( () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute( builder: (BuildContext context) => 
                new ScorePage(quiz.score, quiz.length)
                ), (Route route) => route == null );
            } else {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            }
          });
          })
        : new Container()
      ],
    );
  }
}