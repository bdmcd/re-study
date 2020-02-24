import 'package:restudy/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/styles/colors.dart';
import 'package:restudy/view/views/cards_view.dart';
import 'package:restudy/view/views/login_view.dart';
import 'package:restudy/widgets/loading_widget.dart';

import 'bloc/auth_bloc.dart';

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
        } else if (state is AuthLoadingState) {
          return LoadingWidget();
        }
        return Container(child: CardsView());
      },
    );
  }
}
