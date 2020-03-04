import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

class AddCardView extends StatefulWidget {
  @override
  AddCardViewState createState() {
    return AddCardViewState();
  }
}

class AddCardViewState extends State<AddCardView> {
  final _formKey = GlobalKey<FormState>();
  String answer = "";
  String question = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Add Card"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _cancelAddCard(context);
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
      body: BlocConsumer<CardsBloc, CardsState>(listener: (context, state) {
        if (state is CardsInitialState) {
          Navigator.of(context).pop();
        } else if (state is CardsInitialState) {
          _backToSet(context);
        } else if (state is CardsErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Could not save set")));
        }
      }, builder: (context, state) {
        return Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: STD_VERTICAL_MARGIN * 2),
                    child: TestFieldInputFieldWidget(
                      header: "Front (Question):",
                      autofocus: true,
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
                          left: STD_HORIZONTAL_MARGIN),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: STD_BUTTON_HEIGHT,
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _addCard(context);
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: BUT_FONT_SIZE,
                            ),
                          ),
                          color: APP_PRIMARY_COLOR,
                        ),
                      )),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  _cancelAddCard(BuildContext context) {
    CardsBloc.of(context).add(CardsCancelAddCardEvent());
  }

  _addCard(BuildContext context) {
    CardsBloc.of(context).add(CardsSaveAddCardEvent());
  }

  _backToSet(BuildContext context) {
    Navigator.of(context).pop();
  }
}
