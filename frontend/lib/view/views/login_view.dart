import 'package:flutter/material.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restudy/view/views/cardsView/cards_view.dart';
import 'package:restudy/widgets/divider_line_painter.dart';
import 'package:restudy/bloc/auth_bloc.dart';
import 'package:restudy/widgets/loading_widget.dart';
import 'package:restudy/widgets/text_input_field_widget.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

const Pattern EMAIL_VALIDATION = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

class LoginView extends StatefulWidget {
  @override
  LoginViewState createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  // Form key allows field validation
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Re:Study"),),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Form(
                // Form uses _formKey
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: STD_VERTICAL_MARGIN * 2),
                      child: TestFieldInputFieldWidget(
                        header: "E-mail:",
                        userInput: (email) {
                          this.email = email;
                        },
                        validator: (String userEmail) {
                          if (userEmail.isEmpty) {
                            return 'Enter a valid email address';
                          }
                          if (!(RegExp(EMAIL_VALIDATION).hasMatch(userEmail))) {
                              return "Invalid Email";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: STD_VERTICAL_MARGIN),
                      child: TestFieldInputFieldWidget(
                        header: "Password:",
                        userInput: (password) {
                          this.password = password;
                        },
                        obscureText: true,
                        validator: (String userPassword) {
                          if (userPassword.isEmpty) {
                            return 'Enter a password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: STD_VERTICAL_MARGIN * 2,
                          left: STD_HORIZONTAL_MARGIN,
                          right: STD_HORIZONTAL_MARGIN,
                          bottom: STD_VERTICAL_MARGIN / 2),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: STD_BUTTON_HEIGHT,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              register(context);
                            }
                          },
                          child:
                              Text("Register", style: TextStyle(fontSize: BUT_FONT_SIZE)),
                          color: APP_PRIMARY_COLOR,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: STD_HORIZONTAL_MARGIN),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: STD_BUTTON_HEIGHT,
                        child: OutlineButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              login(context);
                            }
                          },
                          child: Text("Login", style: TextStyle(fontSize: BUT_FONT_SIZE)),
                          color: Colors.white,
                          textColor: APP_PRIMARY_COLOR,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: STD_VERTICAL_MARGIN,
                          left: STD_HORIZONTAL_MARGIN,
                          right: STD_HORIZONTAL_MARGIN,
                          bottom: STD_VERTICAL_MARGIN),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: STD_BUTTON_HEIGHT,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: CustomPaint(
                                  painter: DividerLinePainter(
                                      width: (MediaQuery.of(context).size.width -
                                          (STD_HORIZONTAL_MARGIN * 2)),)),
                              top: STD_VERTICAL_MARGIN,
                            ),
                            Positioned(
                              child: Container(
                                height: 40,
                                width: 40,
                                color: COLOR_APP_BG,
                              ),
                              left: (MediaQuery.of(context).size.width / 2 -
                                      STD_HORIZONTAL_MARGIN) -
                                  20,
                            ),
                            Positioned(
                              child:
                                  Text("OR", style: TextStyle(color: TEXT_HEADER_GREY)),
                              left: (MediaQuery.of(context).size.width / 2 -
                                      STD_HORIZONTAL_MARGIN) -
                                  10,
                              top: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: STD_HORIZONTAL_MARGIN),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: STD_BUTTON_HEIGHT,
                        child: OutlineButton(
                          onPressed: () {
                            googleSignIn(context);
                          },
                          child:
                              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image(image: AssetImage("lib/images/google.png")),
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
              ),
              state is AuthLoadingState ? LoadingWidget() : Container(),
            ],
          );
        }
      ),
    );
  }

  login(BuildContext context) {
    AuthBloc.of(context).add(AuthSignInEvent(
      email: this.email,
      password: this.password,
    ));
  }

  register(BuildContext context) {
    print("register with $email and $password");
    AuthBloc.of(context).add(AuthRegisterEvent(
      email: this.email,
      password: this.password,
    ));
    // authBloc.close();
  }

  googleSignIn(BuildContext context) {
    AuthBloc.of(context).add(AuthSignInWithGoogleEvent());
  }
}
