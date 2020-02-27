import 'package:flutter/material.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

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
          title: Text("Edit Card"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  saveCard(context);
                }
              },
              child: Text(
                "Done",
                style: TextStyle(
                    color: APP_PRIMARY_COLOR, fontSize: BUT_FONT_SIZE),
              ),
            )
          ],
        ),
        body: Column (
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
                      userInput: (email) {
                        // this.email = email;
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
                      userInput: (password) {
                        // this.password = password;
                      },
                      validator: (String userPassword) {
                        if (userPassword.isEmpty) {
                          return 'Please enter an answer';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveCard(BuildContext context) {
    CardsBloc.of(context).add(CardsSaveEvent());
  }
}
