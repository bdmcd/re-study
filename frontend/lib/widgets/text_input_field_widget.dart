import 'package:flutter/material.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

// Create a Form widget.
class TestFieldInputFieldWidget extends StatefulWidget {
  final String header;
  final ValueChanged<String> userInput;
  final String Function(String) validator;
  final bool obscureText;

  TestFieldInputFieldWidget({
    @required this.header,
    @required this.userInput,
    @required this.validator,
    this.obscureText = false
  });

  @override
  TestFieldInputFieldWidgetState createState() {
    return TestFieldInputFieldWidgetState();
  }
}

class TestFieldInputFieldWidgetState extends State<TestFieldInputFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: STD_HORIZONTAL_MARGIN, right: STD_HORIZONTAL_MARGIN), 
          child:
          Text(widget.header, 
            style: new TextStyle(
              fontSize: TEXT_FIELD_HEADER_FONT_SIZE,
              color: TEXT_HEADER_GREY,
            )
          ),
        ),
        Padding(  
          padding: const EdgeInsets.symmetric(horizontal: STD_HORIZONTAL_MARGIN),
          child:
          TextFormField(
            onChanged: (text) {
              widget.userInput(text);
            },
            obscureText: widget.obscureText,
            validator: widget.validator,
            style: TextStyle(fontSize: TEXT_FIELD_INPUT_FONT_SIZE),
          ),
        )
      ],
    );
  }
}