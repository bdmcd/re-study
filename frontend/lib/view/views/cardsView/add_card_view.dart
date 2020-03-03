import 'package:flutter/material.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

class AddCardView extends StatefulWidget {
  AddCardView() : super(key: ValueKey<int>(4));

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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Add Card"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                cancelAddCard(context);
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
        body: Column(
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
                              addCard(context);
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
        ),
      ),
    );
  }

  cancelAddCard(BuildContext context) {
    CardsBloc.of(context).add(CardsCancelAddCardEvent());
  }

  addCard(BuildContext context) {
    CardsBloc.of(context).add(CardsSaveAddCardEvent());
  }
}
