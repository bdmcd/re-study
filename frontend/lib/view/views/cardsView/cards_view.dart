import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/edit_card.dart';
import 'package:restudy/widgets/card_widget.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

import 'cards_editing_view.dart';

class CardsView extends StatefulWidget {
  @override
  CardsViewState createState() {
    return CardsViewState();
  }
}

class CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardsBloc(),
      child: Scaffold(
        body: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            if (state is CardsEditingSetState) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 100),
                switchOutCurve: Threshold(0),
                child: CardsEditingView(),
              );
            } else if (state is CardsEditingCardState) {
              return AnimatedSwitcher(
                  duration: Duration(milliseconds: 100),
                  switchOutCurve: Threshold(0),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, .005),
                        end: const Offset(0, 0),
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: EditCardView());
            }
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              switchOutCurve: Threshold(0),
              child: Scaffold(
                key: ValueKey(2),
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
                          editSet(context);
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
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Card(
                                    child: InkWell(
                                      splashColor:
                                          APP_PRIMARY_COLOR.withAlpha(30),
                                      onTap: () {
                                        addCard();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  fontSize:
                                                      TEXT_FIELD_INPUT_FONT_SIZE,
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
                                CardWidget(
                                  answerText: "Answer",
                                  questionText: "Question",
                                  includeIcon: true,
                                  actionIconButton: IconButton(
                                    icon: Icon(Icons.edit),
                                    color: SECONDARY_BUTTON_COLOR,
                                    onPressed: () {
                                      editCard(context);
                                    },
                                  ),
                                )
                              ],
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
                      studySet(context);
                    },
                    label: Text(
                      'Study',
                      style: TextStyle(fontSize: BUT_FONT_SIZE),
                    ),
                    icon: Icon(Icons.done_all),
                    backgroundColor: APP_PRIMARY_COLOR,
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              ),
            );
          },
        ),
      ),
    );
  }

  editSet(BuildContext context) {
    CardsBloc.of(context).add(CardsEditSetEvent());
  }

  backToSets() {}

  addCard() {}

  studySet(BuildContext context) {
    CardsBloc.of(context).add(CardsStudyEvent());
  }

  editCard(BuildContext context) {
    CardsBloc.of(context).add(CardsEditCardEvent());
  }
}
