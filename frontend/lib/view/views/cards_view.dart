import 'package:flutter/material.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
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
    if (editMode) {
      return Text("Edit Mode");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Name"),
        leading: IconButton(
          color: APP_PRIMARY_COLOR,
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: APP_PRIMARY_COLOR,
              ),
              onPressed: () {
                enterEditSet();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    "Set Name",
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
                    "0 Cards",
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: STD_VERTICAL_MARGIN,
                      left: STD_HORIZONTAL_MARGIN,
                      right: STD_HORIZONTAL_MARGIN,
                      bottom: 0.0),
                  child: Center(
                    child: Card(
                      child: InkWell(
                        splashColor: APP_PRIMARY_COLOR.withAlpha(30),
                        onTap: () {
                          addCard();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Text('Study', style: TextStyle(fontSize: BUT_FONT_SIZE),),
          icon: Icon(Icons.done_all),
          backgroundColor: APP_PRIMARY_COLOR,
        ),
      ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  enterEditSet() {
    setState(() {
      editMode = true;
    });
  }

  backToSets() {}

  addCard() {}
}
