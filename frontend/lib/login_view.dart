import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/widgets/divider_line_painter.dart';

import 'bloc/auth_bloc.dart';
import 'widgets/text_input_field_widget.dart';
import 'styles/spacings.dart';
import 'styles/colors.dart';

// Create a Form widget.
class LoginView extends StatefulWidget {
  @override
  LoginViewState createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: STD_VERT_MARGIN),
            child: TestFieldInputFieldWidget(
              header: "E-mail:",
              userInput: (email) {
                this.email = email;
              },
              validator: (String userEmail) {
                if (userEmail.isEmpty) {
                  return 'Email empty';
                } else if (userEmail.length < 3) {
                  return 'Email too short';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: STD_VERT_MARGIN),
            child: TestFieldInputFieldWidget(
              header: "Password:",
              userInput: (password) {
                this.password = password;
              },
              validator: (String userPassword) {
                if (userPassword.isEmpty) {
                  return 'Password empty';
                } else if (userPassword.length < 3) {
                  return 'PasswordShort';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: STD_VERT_MARGIN * 2,
                left: STD_HOR_MARGIN,
                right: STD_HOR_MARGIN,
                bottom: STD_VERT_MARGIN / 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: STD_BUT_HEIGHT,
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    register(context);
                  }
                },
                child:
                    Text("Register", style: TextStyle(fontSize: BUT_FONT_SIZE)),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: STD_HOR_MARGIN),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: STD_BUT_HEIGHT,
              child: OutlineButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    login(context);
                  }
                },
                child: Text("Login", style: TextStyle(fontSize: BUT_FONT_SIZE)),
                color: Colors.white,
                textColor: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: STD_VERT_MARGIN,
                left: STD_HOR_MARGIN,
                right: STD_HOR_MARGIN,
                bottom: STD_VERT_MARGIN),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: STD_BUT_HEIGHT,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: CustomPaint(
                        painter: DividerLinePainter(
                            width: MediaQuery.of(context).size.width -
                                (STD_HOR_MARGIN * 2),
                            horizontalOffset: 0)),
                    top: STD_VERT_MARGIN,
                  ),
                  Positioned(
                    child: Container(
                      height: 40,
                      width: 40,
                      color: COLOR_APP_BG,
                    ),
                    left: (MediaQuery.of(context).size.width / 2 -
                            STD_HOR_MARGIN) -
                        20,
                  ),
                  Positioned(
                    child:
                        Text("OR", style: TextStyle(color: TEXT_HEADER_GREY)),
                    left: (MediaQuery.of(context).size.width / 2 -
                            STD_HOR_MARGIN) -
                        10,
                    top: 12,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: STD_HOR_MARGIN),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: STD_BUT_HEIGHT,
              child: OutlineButton(
                onPressed: () {
                  googleSignIn(context);
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image(image: AssetImage("images/google.png")),
                  ),
                  Text("Sign in with Google",
                      style: TextStyle(fontSize: BUT_FONT_SIZE)),
                ]),
                color: Colors.white,
                textColor: TEXT_BLACK,
              ),
            ),
          ),
        ],
      ),
    );
  }

  login(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(AuthSignInEvent(
      email: this.email,
      password: this.password,
    ));
    // authBloc.close();
  }

  register(BuildContext context) {
    print("registering with $email and $password");
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(AuthRegisterEvent(
      email: this.email,
      password: this.password,
    ));
    // authBloc.close();
  }

  googleSignIn(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(AuthSignInWithGoogleEvent());
    // authBloc.close();
  }
}
