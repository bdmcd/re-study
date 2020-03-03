import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/cards_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

class MoveCardView extends StatefulWidget {

  @override
  MoveCardViewState createState() {
    return MoveCardViewState();
  }
}

class MoveCardViewState extends State<MoveCardView> {

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
                _cancelMoveCard(context);
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
        body: BlocConsumer<CardsBloc, CardsState>(
          listener: (context, state) {
            if (state is CardsEditingCardState) {
              print("Back to editing state");
              // Navigator.of(context).pop();
            } else if (state is CardsErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Could not save set")));
            }
          },
          builder: (context, state) {
            return Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Text"),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _cancelMoveCard(BuildContext context) {
    Navigator.of(context).pop();
    CardsBloc.of(context).add(CardsCancelMoveCardEvent());
  }
}
