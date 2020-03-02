import 'package:flutter/cupertino.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/styles/spacings.dart';

class CardWidget extends StatefulWidget {
  final String questionText;
  final String answerText;
  final IconButton actionIconButton;
  final bool includeIcon;

  CardWidget(
      {Key key,
      @required this.questionText,
      @required this.answerText,
      this.actionIconButton,
      this.includeIcon = false})
      : super(key: key);

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
        shape: RoundedRectangleBorder(
          side: BorderSide(color: BORDER_GREY),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(
          splashColor: APP_PRIMARY_COLOR.withAlpha(30),
          onTap: () {
            this._flipCard();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: CARD_HEIGHT,
            child: Padding(
              padding: EdgeInsets.only(
                top: STD_VERTICAL_MARGIN * 2,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
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
                  Positioned(
                    child: widget.includeIcon
                        ? widget.actionIconButton
                        : Container(),
                    bottom: 0,
                    right: 0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
