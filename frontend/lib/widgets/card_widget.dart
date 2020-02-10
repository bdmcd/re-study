import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String questionText;
  final String answerText;
  bool front;

  CardWidget({Key key, this.questionText, this.answerText, this.front})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;
    text = this.front ? this.questionText : this.answerText;
    return Center(
    child: Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          this.front = !this.front;
          text = this.front ? this.questionText : this.answerText;
        },
        child: Container(
          width: 300,
          height: 150,
          child: Center(
            child: Text(text),
            )
        ),
      ),
    ),
  );
  }
}
