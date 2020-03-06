import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/auth_bloc.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/styles/spacings.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticatedState) {
            Navigator.of(context).pop();
          } else if (state is AuthErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Error signing the user out"))
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(STD_HORIZONTAL_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: STD_BUTTON_HEIGHT,
                  width: double.infinity,
                  child: FlatButton(
                    color: APP_PRIMARY_COLOR,
                    child: Text(
                      "Sign Out",
                      style: Theme.of(context).textTheme.button.copyWith(
                        fontSize: BUT_FONT_SIZE,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      AuthBloc.of(context).add(AuthSignOutEvent());
                    },
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}