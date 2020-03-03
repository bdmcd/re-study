import 'package:flutter/material.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

class MoveCardView extends StatefulWidget {
  MoveCardView() : super(key: ValueKey<int>(4));

  @override
  MoveCardViewState createState() {
    return MoveCardViewState();
  }
}

class MoveCardViewState extends State<MoveCardView> {
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
          title: Text("Move to Set"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                // cancelAddCard(context);
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
              // Form uses _formKey
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
}
