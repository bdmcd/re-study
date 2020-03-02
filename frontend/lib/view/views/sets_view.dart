import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/sets_bloc.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/model/set_info.dart';

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
          if (state is AuthErrorState) {
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
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

  Widget addBlock(BuildContext context) {
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
                Icons.add,
                size: this.boxSize / 3,
                color: APP_PRIMARY_COLOR,
              ),
              Text(
                "Add Set",
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

  Widget setBlock(BuildContext context, IconData icon, SetInfo setInfo) {
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
                  setInfo.setTitle,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Text(
                setInfo.numCards.toString() + " cards",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                setInfo.accuracy.toString() + "% accuracy",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          onPressed: () {
            // get cards from set via setInfo.guid
            _openSet(context, setInfo.guid);
          },
        ),
      ),
    );
  }

  final mockSets = [
    SetInfo(setTitle: "Biology", accuracy: 10.3, numCards: 17, guid: "1"),
    SetInfo(setTitle: "Chemistry", accuracy: 5.7, numCards: 20, guid: "2"),
    SetInfo(setTitle: "CS 428", accuracy: 80.9, numCards: 13, guid: "3"),
    SetInfo(setTitle: "English", accuracy: 12.4, numCards: 8, guid: "4"),
    SetInfo(setTitle: "Spanish", accuracy: 33.0, numCards: 42, guid: "5"),
    SetInfo(
        setTitle: "Book of Mormon", accuracy: 46.2, numCards: 14, guid: "6"),
  ];

  final mockTodaySet = SetInfo(
    setTitle: "Today's Set",
    accuracy: 8.2,
    numCards: 24,
    guid: "TODAY",
  );

  Widget setsView(BuildContext context) {
    final addSetBox = addBlock(context);
    final todaysSet = setBlock(
      context,
      Icons.calendar_today,
      mockTodaySet,
    );

    var sets = <Widget>[];
    var i = 0;
    while (i < mockSets.length) {
      var temp = <Widget>[
        setBlock(context, Icons.alarm_on, mockSets[i]),
      ];
      if (i < mockSets.length - 1) {
        temp.add(setBlock(context, Icons.alarm_on, mockSets[i + 1]));
      }

      sets.add(
        Row(
          children: temp,
        ),
      );
      i += 2;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Re:Study"),
      ),
      body: ListView(
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

  _addSet(BuildContext context) {
    SetsBloc.of(context).add(AddSetEvent());
  }

  _saveSet(BuildContext context, String title) {
    SetsBloc.of(context).add(SaveSetEvent(setTitle: title));
  }

  _viewSets(BuildContext context) {
    SetsBloc.of(context).add(SetsInitEvent());
  }

  _openSet(BuildContext context, String setGuid) {
    print("Open Set " + setGuid);
    // change to cards view for setGuid's set
  }
}
