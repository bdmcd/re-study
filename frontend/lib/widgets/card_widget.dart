import 'package:flutter/cupertino.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String questionText;
  final String answerText;

  CardWidget({Key key, this.questionText, this.answerText}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool front = true;

  void _flipCard() {
    setState(() {
      this.front = !this.front;
    });
  }

  @override
  Widget build(BuildContext context) {
    String text;
    text = this.front ? this.widget.questionText : this.widget.answerText;
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            this._flipCard();
          },
          child: Container(
            width: 300,
            height: 150,
            child: Padding(
              padding: EdgeInsets.only(top: 40,),
              child: Column(
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.sync),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
