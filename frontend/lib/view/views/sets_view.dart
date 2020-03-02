import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/sets_bloc.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';

class SetsView extends StatelessWidget {
  double boxSize;

  @override
  Widget build(BuildContext context) {
    boxSize = MediaQuery.of(context).size.width * 3 / 7;
    return BlocProvider<SetsBloc>(
      create: (_) => SetsBloc(),
      child: BlocConsumer<SetsBloc, SetsState>(
        builder: (context, state) {
          print(state);
          print(state);
          if (state is SetsInitialState) {
            print("");
            return setsView(context);
          } else if (state is AddSetState) {
            return addSetView(context);
          }
          return setsView(context);
        },
        listener: (context, state) {
          // if (state is AuthErrorState) {
          //   Scaffold.of(context).hideCurrentSnackBar();
          //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          // }
        },
      ),
    );
  }

  Widget addSetView(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var setTitle = "";
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            _viewSets(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text("Add Set"),
        FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _saveSet(context, setTitle);
            }
          },
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.blue[300],
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: header,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25, left: 5),
              child: TestFieldInputFieldWidget(
                header: "Set Title",
                userInput: (title) {
                  setTitle = title;
                },
                validator: (String title) {
                  if (title.isEmpty) {
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addBlock(BuildContext context, IconData icon, String setName) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        width: this.boxSize,
        height: this.boxSize * 7 / 8,
        child: RaisedButton(
          // padding: EdgeInsets.all(5),
          elevation: 6,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: this.boxSize / 3,
                color: APP_PRIMARY_COLOR,
              ),
              Text(
                setName,
                style: TextStyle(
                  color: APP_PRIMARY_COLOR,
                ),
              ),
            ],
          ),
          onPressed: () {
            _addSet(context);
          },
        ),
      ),
    );
  }

  Widget setBlock(BuildContext context, IconData icon, String setName) {
    int numCards = 5;
    double accuracy = 4.5;

    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        width: this.boxSize,
        height: this.boxSize * 7 / 8,
        child: RaisedButton(
          elevation: 6,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: this.boxSize / 3,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  setName,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Text(
                numCards.toString() + " cards",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                accuracy.toString() + "% accuracy",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget setsView(BuildContext context) {
    final addSetBox = addBlock(context, Icons.add, "Add Set");
    final todaysSet = setBlock(context, Icons.calendar_today, "Today's Set");

    var sets = <Widget>[];
    var i = 0;
    while (i < 10) {
      sets.add(
        Row(
          children: <Widget>[
            setBlock(context, Icons.alarm_on, "Test Set"),
            setBlock(context, Icons.alarm_on, "Test Set"),
          ],
        ),
      );
      i += 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Re:Study"),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              addSetBox,
              todaysSet,
            ],
          ),
          Column(
            children: sets,
          ),
        ],
      ),
    );
  }

  // Widget consumer() {
  //   return BlocConsumer<SetsBloc, SetsState>(
  //     builder: (context, state) {
  //       print(state);
  //       // return Center(
  //       return Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text("TEST"),
  //         ],
  //       );
  //       // if (state is AuthLoadingState) {
  //       //   return Center(
  //       //     child: CircularProgressIndicator()
  //       //   );
  //       // }
  //     },
  //     listener: (context, state) {
  //       // if (state is AuthErrorState) {
  //       //   Scaffold.of(context).hideCurrentSnackBar();
  //       //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error)));
  //       // }
  //     },
  //   );
  // }
  _addSet(BuildContext context) {
    SetsBloc.of(context).add(AddSetEvent());
  }

  _saveSet(BuildContext context, String title) {
    SetsBloc.of(context).add(SaveSetEvent(setTitle: title));
  }

  _viewSets(BuildContext context) {
    SetsBloc.of(context).add(SetsInitEvent());
  }
}
