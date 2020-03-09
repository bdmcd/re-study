import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/auth/auth.dart';
import 'package:restudy/bloc/auth_bloc.dart';
import 'package:restudy/bloc/sets_bloc.dart';
import 'package:restudy/model/flash_card_set.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/view/views/settings_view.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';

class SetsView extends StatelessWidget {
  double boxSize;
  Authenticater _auth = AuthFactory.instance.authenticater;

  @override
  Widget build(BuildContext context) {
    boxSize = MediaQuery.of(context).size.width * 3 / 7;
    return BlocProvider<SetsBloc>(
      create: (_) => SetsBloc(),
      child: BlocConsumer<SetsBloc, SetsState>(
        builder: (context, state) {
          print(state);
          if (state is SetsInitialState) {
            print("");
            return setsView(context, state);
          } else if (state is AddSetState) {
            return addSetView(context);
          }
          return setsView(context, state);
        },
        listener: (context, state) {
          if (state is AddSetsErrorState) {
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
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

  Widget setBlock(BuildContext context, IconData icon, FlashcardSet setInfo) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  setInfo.name,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
          onPressed: () {
            // get cards from set via setInfo.guid
            _openSet(context, setInfo.id);
          },
        ),
      ),
    );
  }

  final mockTodaySet = FlashcardSet(
    name: "Today's Set",
    id: "TODAY",
  );

  Widget setsView(BuildContext context, SetsInitialState state) {
    final addSetBox = addBlock(context);
    final todaysSet = setBlock(
      context,
      Icons.calendar_today,
      mockTodaySet,
    );

    print(state.flashcards.length.toString() + " Flashcards");
    final userSets = state.flashcards;
    var sets = <Widget>[];
    var i = 0;
    while (i < userSets.length) {
      var temp = <Widget>[
        setBlock(context, Icons.alarm_on, userSets[i]),
      ];
      if (i < userSets.length - 1) {
        temp.add(setBlock(context, Icons.alarm_on, userSets[i + 1]));
      }

      sets.add(
        Row(
          children: temp,
        ),
      );
      i += 2;
    }

    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("       "),
        Text("Re:Study"),
        InkWell(
          child: Icon(
            Icons.settings,
            color: Colors.blue,
          ),
          splashColor: Colors.blue[50],
          onTap: () {
            _openSettings(context);
          },
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: header,
        centerTitle: true,
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

  _saveSet(BuildContext context, String title) async {
    final authUser = await _auth.currentUser;
    SetsBloc.of(context)
        .add(SaveSetEvent(setTitle: title, creatorId: authUser.uid));
  }

  _viewSets(BuildContext context) {
    SetsBloc.of(context).add(SetsInitEvent());
  }

  _openSet(BuildContext context, String setGuid) {
    print("Open Set " + setGuid);
    // change to cards view for setGuid's set
  }

  _openSettings(BuildContext prevContext) {
    Navigator.of(prevContext).push(
      new MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: AuthBloc.of(prevContext),
          child: SettingsView(),
        )
      )
    );
  }
}
