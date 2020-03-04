import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/slide_up_transition_route.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

import 'move_card_view.dart';

class EditCardView extends StatefulWidget {
  @override
  EditCardViewState createState() {
    return EditCardViewState();
  }
}

class EditCardViewState extends State<EditCardView> {
  // Form key allows field validation
  final _formKey = GlobalKey<FormState>();
  String answer = "";
  String question = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Edit Card"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _saveCard(context);
                }
              },
              child: Text(
                "Done",
                style: TextStyle(
                    color: APP_PRIMARY_COLOR, fontSize: BUT_FONT_SIZE),
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            )
          ],
        ),
        body: BlocConsumer<CardsBloc, CardsState>(listener: (context, state) {
          if (state is CardsInitialState) {
            Navigator.of(context).pop();
          } else if (state is CardsMovingCardState) {
            _navigateToMoveCardView(context);
          } else if (state is CardsErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Could not save set")));
          }
        }, builder: (context, state) {
          return Column(
            children: <Widget>[
              Form(
                // Form uses _formKey
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: STD_VERTICAL_MARGIN * 2),
                      child: TestFieldInputFieldWidget(
                        initialValue: "Question",
                        header: "Front (Question):",
                        userInput: (question) {
                          this.question = question;
                        },
                        validator: (String userEmail) {
                          if (userEmail.isEmpty) {
                            return 'Please enter a question';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: STD_VERTICAL_MARGIN),
                      child: TestFieldInputFieldWidget(
                        initialValue: "Answer",
                        header: "Back (Answer):",
                        userInput: (answer) {
                          this.answer = answer;
                        },
                        validator: (String userPassword) {
                          if (userPassword.isEmpty) {
                            return 'Please enter an answer';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: STD_VERTICAL_MARGIN * 2,
                          right: STD_HORIZONTAL_MARGIN,
                          left: STD_HORIZONTAL_MARGIN,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ButtonTheme(
                                height: STD_BUTTON_HEIGHT,
                                minWidth: 170.0,
                                child: FlatButton(
                                  onPressed: () {
                                    _deleteCard(context);
                                  },
                                  child: Text(
                                    "Delete card",
                                    style: TextStyle(
                                      fontSize: BUT_FONT_SIZE,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: APP_DESTRUCTIVE_RED,
                                ),
                              ),
                            ),
                            SizedBox(width: STD_HORIZONTAL_MARGIN / 2),
                            Expanded(
                              child: ButtonTheme(
                                height: STD_BUTTON_HEIGHT,
                                minWidth: 170.0,
                                child: FlatButton(
                                  onPressed: () {
                                    _moveCard(context);
                                  },
                                  child: Text(
                                    "Move card",
                                    style: TextStyle(
                                      fontSize: BUT_FONT_SIZE,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: APP_PRIMARY_COLOR,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  _saveCard(BuildContext context) {
    CardsBloc.of(context).add(CardsSaveCardEvent());
  }

  _deleteCard(BuildContext context) {
    CardsBloc.of(context).add(CardsDeleteCardEvent());
  }

  _moveCard(BuildContext context) {
    //validate form first and save card then go to movecardview
    CardsBloc.of(context).add(CardsMoveCardEvent());
  }

  _navigateToMoveCardView(BuildContext prevContext) {
    Navigator.of(prevContext).push(new MaterialPageRoute(
        builder: (context) => BlocProvider.value(
              value: CardsBloc.of(prevContext),
              child: MoveCardView(),
            ),
            fullscreenDialog: true));
  }
}