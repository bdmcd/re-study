import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Set"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                saveSet();
              }
            },
            child: Text(
              "Done",
              style:
                  TextStyle(color: APP_PRIMARY_COLOR, fontSize: BUT_FONT_SIZE),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: Form (
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
                        bottom: 0.0),
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
                  Padding(
                      padding: const EdgeInsets.only(top: STD_VERTICAL_MARGIN * 2, right: STD_HORIZONTAL_MARGIN, left: STD_HORIZONTAL_MARGIN),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: STD_BUTTON_HEIGHT,
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // addCard(context);
                            }
                          },
                          child: Text("Delete set", style: TextStyle(
                            color: Colors.white,
                            fontSize: BUT_FONT_SIZE,
                          ),),
                          color: APP_DESTRUCTIVE_RED,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveSet() {
    CardsBloc.of(context).add(CardsSaveEvent());
  }

  backToSets() {}

  addCard() {}
}
