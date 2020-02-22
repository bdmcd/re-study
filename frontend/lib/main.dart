import 'package:restudy/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/view/views/auth_test_view.dart';

import 'bloc/auth_bloc.dart';
import 'login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: AuthenticationRoot(),
    );
  }
}

class AuthenticationRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthUnauthenticatedState) {
          return LoginView();
        }
        else if (state is AuthLoadingState) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Container(
          child: Center(
            child: RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {
                AuthBloc.of(context).add(AuthSignOutEvent());
              },
            )
          ),
        );
      },
    );
  }
}

