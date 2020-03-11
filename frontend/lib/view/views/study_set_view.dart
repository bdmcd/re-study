import 'dart:math';

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
  int index = 0;
  List<bool> answerList;
  // List<Flashcard> allFlashcards;
  final allFlashcards = [
    Flashcard(
        answer: "Blue",
        question: "What color is the sky?",
        creatorId: "98h7gy23efwr",
        setId: "90238dj98jd",
        retentionScore: 90.0,
        id: Random().nextInt(100).toString()),
    Flashcard(
        answer: "Clear",
        question: "What color is the water?",
        creatorId: "98h7gy23efwr",
        setId: "90238dj98jd",
        retentionScore: 90.0,
        id: Random().nextInt(100).toString()),
    Flashcard(
        answer: "Yellow",
        question: "What color is the sun?",
        creatorId: "98h7gy23efwr",
        setId: "90238dj98jd",
        retentionScore: 90.0,
        id: Random().nextInt(100).toString()),
    Flashcard(
        answer: "Green",
        question: "What color is the grass?",
        creatorId: "98h7gy23efwr",
        setId: "90238dj98jd",
        retentionScore: 90.0,
        id: Random().nextInt(100).toString()),
    Flashcard(
        answer: "Red",
        question: "What color is the blood?",
        creatorId: "98h7gy23efwr",
        setId: "90238dj98jd",
        retentionScore: 90.0,
        id: Random().nextInt(100).toString()),
  ];

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
          child: !this.doneStudying ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: STD_HORIZONTAL_MARGIN,
                    right: STD_HORIZONTAL_MARGIN,
                    bottom: STD_VERTICAL_MARGIN / 2),
                child: AnimatedSwitcher(
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return SlideTransition(

                        position: Tween<Offset>(
                          begin: const Offset(0, -1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    duration: Duration(milliseconds: 500),
                    switchOutCurve: Threshold(0),
                    child: _buildCard(context, this.allFlashcards[this.index])),
              ),
              Text(
                (this.index + 1).toString() + " of 5",
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
                          onPressed: () {
                            _nextCard();
                          },
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
                          onPressed: () {
                            _nextCard();
                          },
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
          ) : _showResults(context),
        ),
      );
    });
  }

  _nextCard() {
    if (this.index == this.allFlashcards.length - 1) {
      this.doneStudying = true;
    } else {
      this.index++;
    }
    setState(() {});
  }

  Widget _buildCard(BuildContext context, Flashcard flashcard) {
    return CardWidget(
      key: Key(flashcard.id),
      answerText: flashcard.answer,
      questionText: flashcard.question,
    );
  }

  Widget _showResults(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            bottom: STD_VERTICAL_MARGIN,
          ),
          child: 
            Image(image: AssetImage("images/study_results_perfect.png")),
        ),
        Text("Perfect!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: TEXT_HEADER_GREY),),
      ],
    );
  }

  _backToSet(BuildContext context) {
    Navigator.of(context).pop();
  }

  _doneStudying(BuildContext context) {
    CardsBloc.of(context).add(CardsDoneStudyingEvent());
  }
}
