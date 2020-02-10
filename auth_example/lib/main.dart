import 'package:bloc_app/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        ],
        child: AuthRoot(),
      ),
    );
  }
}

class AuthRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return Center(
            child: CircularProgressIndicator()
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Register"),
                onPressed: state is AuthAuthenticatedState ? null : () => _register(context),
              ),
              RaisedButton(
                child: Text("Sign In"),
                onPressed: state is AuthAuthenticatedState ? null : () => _signIn(context),
              ),
              RaisedButton(
                child: Text("Sign In With Google"),
                onPressed: state is AuthAuthenticatedState ? null : () => _signInWithGoogle(context),
              ),
              RaisedButton(
                child: Text("Sign Out"),
                onPressed: state is AuthAuthenticatedState ? () => _signOut(context) : null,
              ),
              Text(state.toString()),
              _buildUserInfo(context, state)
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserInfo(context, state) {
    if (state is AuthAuthenticatedState) {
      return Column(
        children: <Widget>[
          Text('uid: ${state.user.id}'),
          Text('name: ${state.user.name}'),
          Text('email: ${state.user.email}'),
        ],
      );
    }

    return Container();
  }

  _register(BuildContext context) {
    AuthBloc.of(context).add(
      AuthRegisterEvent(
        email: "testuser@gmail.com",
        password: "Password1",
      )
    );
  }

  _signIn(BuildContext context) {
    AuthBloc.of(context).add(
      AuthSignInEvent(
        email: "testuser@gmail.com",
        password: "Password1",
      )
    );
  }

  _signInWithGoogle(BuildContext context) {
    AuthBloc.of(context).add(
      AuthSignInWithGoogleEvent()
    );
  }

  _signOut(BuildContext context) {
    AuthBloc.of(context).add(
      AuthSignOutEvent()
    );
  }
}