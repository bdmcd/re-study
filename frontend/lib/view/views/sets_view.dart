import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/bloc/sets_bloc.dart';

class SetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetsBlock, SetsState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        // if (state is AuthLoadingState) {
        //   return Center(
        //     child: CircularProgressIndicator()
        //   );
        // }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("TEST"),
              // RaisedButton(
              //   child: Text("Register"),
              //   onPressed: state is AuthAuthenticatedState ? null : () => _register(context),
              // ),
              // RaisedButton(
              //   child: Text("Sign In"),
              //   onPressed: state is AuthAuthenticatedState ? null : () => _signIn(context),
              // ),
              // RaisedButton(
              //   child: Text("Sign In With Google"),
              //   onPressed: state is AuthAuthenticatedState ? null : () => _signInWithGoogle(context),
              // ),
              // RaisedButton(
              //   child: Text("Sign Out"),
              //   onPressed: state is AuthAuthenticatedState ? () => _signOut(context) : null,
              // ),
              // Text(state.toString()),
              // _buildUserInfo(context, state)
            ],
          ),
        );
      },
    );
  }
}