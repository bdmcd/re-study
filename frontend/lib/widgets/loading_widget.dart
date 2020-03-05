import 'package:flutter/material.dart';
import 'package:restudy/styles/colors.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}