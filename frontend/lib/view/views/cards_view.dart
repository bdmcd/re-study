import 'package:flutter/material.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/bloc/auth_bloc.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

class CardsView extends StatefulWidget {
  @override
  CardsViewState createState() {
    return CardsViewState();
  }
}

class CardsViewState extends State<CardsView> {
  String email = "";
  String password = "";
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SET_NAME"),
        leading: IconButton(
          color: APP_MAIN_COLOR,
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: APP_MAIN_COLOR,
              ),
              onPressed: () {
                enterEditSet();
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: STD_VERTICAL_MARGIN * 2,
                    left: STD_HORIZONTAL_MARGIN,
                    right: STD_HORIZONTAL_MARGIN,
                    bottom: 0.0),
                child: Text(
                  "SET_NAME",
                  style: TextStyle(
                      color: TEXT_BLACK,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0,
                    left: STD_HORIZONTAL_MARGIN,
                    right: STD_HORIZONTAL_MARGIN,
                    bottom: 0.0),
                child: Text(
                  "NUM_CARDS",
                  style: TextStyle(
                    color: TEXT_HEADER_GREY,
                    fontSize: TEXT_BODY_FONT_SIZE,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0,
                    left: STD_HORIZONTAL_MARGIN,
                    right: STD_HORIZONTAL_MARGIN,
                    bottom: 0.0),
                child: Text(
                  "0% Accuracy",
                  style: TextStyle(
                    color: TEXT_BLACK,
                    fontSize: TEXT_BODY_FONT_SIZE,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: STD_VERTICAL_MARGIN,
                    left: STD_HORIZONTAL_MARGIN,
                    right: STD_HORIZONTAL_MARGIN,
                    bottom: 0.0),
                child: CustomPaint(
                    painter: DividerLinePainter(
                  width: MediaQuery.of(context).size.width -
                      (STD_HORIZONTAL_MARGIN * 2),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  enterEditSet() {
    editMode = true;
  }

  backToSets() {}
}
