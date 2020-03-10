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

  CardWidget({
    Key key,
    @required this.questionText,
    @required this.answerText,
    this.actionIconButton,
    this.includeIcon = false,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool front = true;

  void _flipCard(PointerEvent details) {
    setState(() {
      this.front = !this.front;
    });
  }

  // TODO: make card flip

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: _flipCard,
        onPointerUp: _flipCard,
        child: Card(
          color: this.front ? Colors.white : Color.fromARGB(255, 245, 245, 245),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: BORDER_GREY),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: CARD_HEIGHT,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Center(
                    child: Text(
                      this.front 
                          ? this.widget.questionText
                          : this.widget.answerText,
                      style: TextStyle(
                        fontSize: TEXT_BODY_FONT_SIZE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  child: widget.includeIcon 
                      ? widget.actionIconButton
                      : Container(),
                  bottom: 0,
                  right: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

