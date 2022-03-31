import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/widgets/loading_widget.dart';

class MoveCardView extends StatefulWidget {
  final String cardId;

  const MoveCardView({this.cardId});
  @override
  MoveCardViewState createState() {
    return MoveCardViewState(cardId: this.cardId);
  }
}

class MoveCardViewState extends State<MoveCardView> {
  final String cardId;

  MoveCardViewState({this.cardId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Move to Set"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _cancelMoveCard(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: APP_DESTRUCTIVE_RED, fontSize: BUT_FONT_SIZE),
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            )
          ],
        ),
        body: BlocConsumer<CardsBloc, CardsState>(
          listener: (context, state) {
            if (state is CardsCancelledMoveCardState) {
              print("Back to editing state");
              _backToEditingState(context);
            } else if (state is CardsCardMovedState) {
              _backToSet(context);
            } else if (state is CardsErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Could not save set")));
            }
          },
          builder: (context, state) {
            var sets = <Widget>[];
            if (state is CardsMovingCardState) {
              for (var userSet in state.setInfo) {
                sets.add(setListItem(context, userSet.name, userSet.id));
              }
              return ListView(
                children: sets.length == 0
                    ? <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: STD_VERTICAL_MARGIN * 2,
                              right: STD_HORIZONTAL_MARGIN,
                              left: STD_HORIZONTAL_MARGIN),
                          child: Center(
                            child: Text(
                              "No other sets",
                              style: TextStyle(
                                color: TEXT_HEADER_GREY,
                                fontSize: TEXT_BODY_FONT_SIZE,
                              ),
                            ),
                          ),
                        ),
                      ]
                    : sets,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget setListItem(BuildContext context, String setName, String setId) {
    return ListTile(
      title: Text(
        setName,
        style: TextStyle(
          color: TEXT_BLACK,
          fontSize: BUT_FONT_SIZE,
        ),
      ),
      onTap: () {
        _moveCardToSet(context, setId);
      },
    );
  }

  _cancelMoveCard(BuildContext context) {
    CardsBloc.of(context).add(CardsCancelMoveCardEvent());
  }

  _backToEditingState(BuildContext context) {
    Navigator.of(context).pop();
  }

  _backToSet(BuildContext context) {
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 3);
  }

  _moveCardToSet(BuildContext context, String setId) {
    CardsBloc.of(context)
        .add(CardsMoveCardToSetEvent(cardGuid: this.cardId, setId: setId));
  }
}
