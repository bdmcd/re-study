import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/model/flash_card.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/widgets/card_widget.dart';

class StudySetView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudySetViewState();
  }
}

class StudySetViewState extends State<StudySetView> {
  bool doneStudying = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardsBloc, CardsState>(listener: (context, state) {
      if (state is CardsInitialState) {
        _backToSet(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            (!doneStudying ? "Studying - " : "Results - ") + "Set name",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: !doneStudying
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _doneStudying(context);
                  })
              : Container(),
          backgroundColor: APP_PRIMARY_COLOR,
          actions: <Widget>[
            doneStudying
                ? FlatButton(
                    onPressed: () {
                      _doneStudying(context);
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white, fontSize: BUT_FONT_SIZE),
                    ),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  )
                : Container(),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: STD_HORIZONTAL_MARGIN,
                    right: STD_HORIZONTAL_MARGIN,
                    bottom: STD_VERTICAL_MARGIN / 2),
                child: _buildCard(
                    context,
                    Flashcard(
                        answer: "Blue",
                        question: "What is the color of the sky?")),
              ),
              Text(
                "1 of 5",
                style: TextStyle(
                    color: TEXT_HEADER_GREY,
                    fontSize: TEXT_BODY_FONT_SIZE,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: STD_VERTICAL_MARGIN * 2,
                      left: STD_HORIZONTAL_MARGIN,
                      right: STD_HORIZONTAL_MARGIN,
                      bottom: STD_VERTICAL_MARGIN * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
                        child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: BORDER_GREY),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.clear,
                                color: APP_DESTRUCTIVE_RED,
                                size: 40,
                              ),
                              Text(
                                "Not Sure",
                                style: TextStyle(
                                    color: TEXT_HEADER_GREY,
                                    fontSize: TEXT_BODY_FONT_SIZE,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Container(
                        width: 120,
                        height: 120,
                        child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: BORDER_GREY),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.done,
                                color: APP_GREEN,
                                size: 40,
                              ),
                              Text(
                                "Got it!",
                                style: TextStyle(
                                    color: TEXT_HEADER_GREY,
                                    fontSize: TEXT_BODY_FONT_SIZE,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }

  _nextCard() {}

  Widget _buildCard(BuildContext context, Flashcard flashcard) {
    return CardWidget(
      answerText: flashcard.answer,
      questionText: flashcard.question,
    );
  }

  _backToSet(BuildContext context) {
    Navigator.of(context).pop();
  }

  _doneStudying(BuildContext context) {
    CardsBloc.of(context).add(CardsDoneStudyingEvent());
  }
}
