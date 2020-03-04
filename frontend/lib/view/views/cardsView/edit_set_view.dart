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
              onPressed: (state is CardsLoadingState)
                  ? null
                  : () {
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
          return Form(
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
                              top: STD_VERTICAL_MARGIN * 2,
                              right: STD_HORIZONTAL_MARGIN,
                              left: STD_HORIZONTAL_MARGIN),
                          child: Center(
                            child: Text(
                              "No cards",
                              style: TextStyle(
                                color: TEXT_HEADER_GREY,
                                fontSize: TEXT_BODY_FONT_SIZE,
                              ),
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
                                  _deleteSet(context);
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

  _backToSet(context) {
    Navigator.of(context).pop();
  }

  _backToSets(BuildContext context) {
    // TODO: If time permits, fix this to use route names instead... this is kind of hacky
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2);
  }
}
