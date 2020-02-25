import 'package:flutter/material.dart';
import 'package:restudy/styles/colors.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: COLOR_APP_BG,
          ),
        ),
      ),
    );
  }
}
