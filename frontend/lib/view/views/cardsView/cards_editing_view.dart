import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';

class CardsEditingView extends StatefulWidget {
  CardsEditingView() : super(key: ValueKey<int>(1));

  @override
  CardsEditingViewState createState() {
    return CardsEditingViewState();
  }
}

class CardsEditingViewState extends State<CardsEditingView> {
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
                    padding: const EdgeInsets.only(
                        top: STD_VERTICAL_MARGIN,
                        left: STD_HORIZONTAL_MARGIN,
                        right: STD_HORIZONTAL_MARGIN,
                        bottom: 0.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            size: ICON_LARGE_SIZE,
                            color: APP_PRIMARY_COLOR,
                          ),
                          Text(
                            "Add Card",
                            style: TextStyle(
                              fontSize: TEXT_FIELD_INPUT_FONT_SIZE,
                              color: APP_PRIMARY_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
