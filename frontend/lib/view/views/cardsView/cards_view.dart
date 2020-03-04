import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/add_card_view.dart';
import 'package:restudy/view/views/cardsView/edit_card_view.dart';
import 'package:restudy/widgets/card_widget.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

import 'edit_set_view.dart';


class CardsView extends StatefulWidget {
  final setGuid;

  CardsView({@required this.setGuid});

  @override
  CardsViewState createState() {
    return CardsViewState();
  }
}

class CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardsBloc(widget.setGuid),
      child: Scaffold(
        body: BlocConsumer<CardsBloc, CardsState>(
          listener: (context, state) {
            if (state is CardsEditingSetState) {
              _navigateToEditSetView(context);
            } else if (state is CardsEditingCardState) {
              _navigateToEditCardView(context);
            } else if (state is CardsAddingCardState) {
              _navigateToAddCardView(context);
            }
          },
          builder: (context, state) {
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
                    onPressed: () {
                      _backToSets(context);
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: APP_PRIMARY_COLOR,
                        ),
                        onPressed: () {
                          _editSet(context);
                        })
                  ],
                ),
                body: ListView(
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
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: BORDER_GREY),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                        APP_PRIMARY_COLOR.withAlpha(30),
                                    onTap: () {
                                      _addCard(context);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: CARD_HEIGHT,
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
                                    _editCard(context);
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
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _studySet(context);
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

  _editSet(BuildContext context) {
    CardsBloc.of(context).add(CardsEditSetEvent());
  }

  _backToSets(context) {
    Navigator.of(context).pop();
  }

  _addCard(BuildContext context) {
    CardsBloc.of(context).add(CardsAddCardEvent());
  }

  _studySet(BuildContext context) {
    CardsBloc.of(context).add(CardsStudyEvent());
  }

  _editCard(BuildContext context) {
    CardsBloc.of(context).add(CardsEditCardEvent());
  }

  _navigateToEditCardView(BuildContext prevContext) {
    Navigator.of(prevContext).push(new MaterialPageRoute(
        builder: (context) => BlocProvider.value(
              value: CardsBloc.of(prevContext),
              child: EditCardView(),
            ),
        fullscreenDialog: true));
  }

  _navigateToEditSetView(BuildContext prevContext) {
    Navigator.of(prevContext).push(new MaterialPageRoute(
        builder: (context) => BlocProvider.value(
              value: CardsBloc.of(prevContext),
              child: EditSetView(),
            ),
        fullscreenDialog: true));
  }

  _navigateToAddCardView(BuildContext prevContext) {
    Navigator.of(prevContext).push(
      new MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: CardsBloc.of(prevContext),
                child: AddCardView(),
              ),
          fullscreenDialog: true),
    );
  }
}
