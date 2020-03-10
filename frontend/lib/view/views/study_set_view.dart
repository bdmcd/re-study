import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/styles/spacings.dart';

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
                    style:
                        TextStyle(color: Colors.white, fontSize: BUT_FONT_SIZE),
                  ),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                )
              : Container(),
        ],
      ));
    });
  }

  _backToSet(BuildContext context) {
    Navigator.of(context).pop();
  }

  _doneStudying(BuildContext context) {
    CardsBloc.of(context).add(CardsDoneStudyingEvent());
  }
}
