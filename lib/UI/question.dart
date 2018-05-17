import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _question;
  final int _questionNumber;

  QuestionText(this._question,this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with TickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _animationController;

  @override
    void initState() {
      super.initState();
      _animationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    }

  @override
  Widget build(BuildContext context) {
    return new Material(
            color: Colors.white,
            child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 20.0),
              child: new Center(
                child: new Text("Statement " + widget._questionNumber.toString() +": " + widget._question),
              ),
            ),
          );
  }
}