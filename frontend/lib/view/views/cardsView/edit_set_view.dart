import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/widgets/card_widget.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';

class EditSetView extends StatefulWidget {
  EditSetView() : super(key: ValueKey<int>(1));

  @override
  EditSetViewState createState() {
    return EditSetViewState();
  }
}

class EditSetViewState extends State<EditSetView> {
  final _formKey = GlobalKey<FormState>();
  final List<Card> cards = List(0);
  final Key key = null;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardsBloc, CardsState>(listener: (context, state) {
      if (state is CardsDeletedState) {
        _backToSets(context);
      } else if (state is CardsInitialState) {
        _backToSet(context);
      } else if (state is CardsErrorState) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Could not save set")));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Edit Set"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _saveSet(context);
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
        body: BlocBuilder<CardsBloc, CardsState>(builder: (context, state) {
          return ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: STD_VERTICAL_MARGIN * 2,
                                left: 0,
                                right: 0,
                                bottom: STD_VERTICAL_MARGIN * 2),
                            child: TestFieldInputFieldWidget(
                              initialValue: "Set Name",
                              header: "Set Name",
                              userInput: (String value) {},
                              validator: (String setName) {
                                if (setName.isEmpty) {
                                  return 'Please enter a set name';
                                }
                                return null;
                              },
                            ),
                          ),
                          // IF NO CARDS

                          // Padding(
                          //     padding: const EdgeInsets.only(
                          //         top: STD_VERTICAL_MARGIN * 2,
                          //         right: STD_HORIZONTAL_MARGIN,
                          //         left: STD_HORIZONTAL_MARGIN),
                          //     child: Center(
                          //       child: Text(
                          //         "No cards",
                          //         style: TextStyle(
                          //           color: TEXT_HEADER_GREY,
                          //           fontSize: TEXT_BODY_FONT_SIZE,
                          //         ),
                          //       ),
                          //     )),

                          // IF CARDS EXIST

                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0,
                                  right: STD_HORIZONTAL_MARGIN,
                                  left: STD_HORIZONTAL_MARGIN),
                              child: Center(
                                child: CardWidget(
                                  answerText: "Answer",
                                  questionText: "Question",
                                  includeIcon: true,
                                  actionIconButton: IconButton(
                                    icon: Icon(Icons.delete_forever),
                                    color: APP_DESTRUCTIVE_RED,
                                    onPressed: () {
                                      _showDeleteCardAlertDialog(context);
                                    },
                                  ),
                                  includeDate: true,
                                  daysToNextReview: "3 days",
                                ),
                              )),

                          Padding(
                              padding: const EdgeInsets.only(
                                  right: STD_HORIZONTAL_MARGIN,
                                  left: STD_HORIZONTAL_MARGIN),
                              child: Center(
                                child: CardWidget(
                                  answerText: "Answer",
                                  questionText: "Question",
                                  includeIcon: true,
                                  actionIconButton: IconButton(
                                    icon: Icon(Icons.delete_forever),
                                    color: APP_DESTRUCTIVE_RED,
                                    onPressed: () {
                                      _showDeleteCardAlertDialog(context);
                                    },
                                  ),
                                  includeDate: true,
                                  daysToNextReview: "3 days",
                                ),
                              )),

                          Padding(
                              padding: const EdgeInsets.only(
                                  top: STD_VERTICAL_MARGIN * 2,
                                  right: STD_HORIZONTAL_MARGIN,
                                  left: STD_HORIZONTAL_MARGIN),
                              child: ButtonTheme(
                                minWidth: MediaQuery.of(context).size.width,
                                height: STD_BUTTON_HEIGHT,
                                child: FlatButton(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _showDeleteSetAlertDialog(context);
                                    }
                                  },
                                  child: Text(
                                    "Delete set",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: BUT_FONT_SIZE,
                                    ),
                                  ),
                                  color: APP_DESTRUCTIVE_RED,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      );
    });
  }

  _saveSet(context) {
    CardsBloc.of(context).add(CardsSaveSetEvent());
  }

  _deleteSet(context) {
    CardsBloc.of(context).add(CardsDeleteSetEvent());
  }

  _deleteCard(context) {
    CardsBloc.of(context).add(CardsDeleteCardFromEditSetEvent());
  }

  _backToSet(context) {
    Navigator.of(context).pop();
  }

  _backToSets(BuildContext context) {
    // TODO: If time permits, fix this to use route names instead... this is kind of hacky
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2);
  }

  _showDeleteSetAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel", style: TextStyle(color: TEXT_HEADER_GREY)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Delete", style: TextStyle(color: APP_DESTRUCTIVE_RED)),
      onPressed: () {
        Navigator.of(context).pop();
        _deleteSet(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Set"),
      content: Text(
          "This action cannot be undone."),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _showDeleteCardAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel", style: TextStyle(color: TEXT_HEADER_GREY)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Delete", style: TextStyle(color: APP_DESTRUCTIVE_RED)),
      onPressed: () {
        Navigator.of(context).pop();
        _deleteCard(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Card"),
      content: Text(
          "This action cannot be undone."),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
