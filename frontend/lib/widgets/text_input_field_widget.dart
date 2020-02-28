import 'package:flutter/material.dart';
import 'package:restudy/styles/spacings.dart';
import 'package:restudy/styles/colors.dart';

class TestFieldInputFieldWidget extends StatefulWidget {
  final String header;
  final ValueChanged<String> userInput;
  final String Function(String) validator;
  final bool obscureText;
  final String initialValue;
  final bool autofocus;
  
  TestFieldInputFieldWidget({
    @required this.header,
    @required this.userInput,
    @required this.validator,
    this.obscureText = false,
    this.initialValue = "",
    this.autofocus = false,
  }) {
    userInput(initialValue);
  }

  @override
  TestFieldInputFieldWidgetState createState() {
    return TestFieldInputFieldWidgetState();
  }
}

class TestFieldInputFieldWidgetState extends State<TestFieldInputFieldWidget> {
  TextEditingController _textFieldController; 
  FocusNode myFocusNode;
  
  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController(text: widget.initialValue);
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  clearField() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
      _textFieldController.clear();
      widget.userInput(_textFieldController.text);
    });
  }

  onTextChange (text) {
    widget.userInput(text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: STD_HORIZONTAL_MARGIN, right: STD_HORIZONTAL_MARGIN),
          child: Text(widget.header,
              style: TextStyle(
                fontSize: TEXT_FIELD_HEADER_FONT_SIZE,
                color: TEXT_HEADER_GREY,
              )),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: STD_HORIZONTAL_MARGIN),
          child: Theme(
            child: TextFormField(
              focusNode: myFocusNode,
              autofocus: widget.autofocus,
              // initialValue: widget.initialValue,
              controller: _textFieldController,
              onChanged: (text) {
                onTextChange(text);
                // fieldIsEmpty = text.isEmpty;
              },
              obscureText: widget.obscureText,
              validator: widget.validator,
              style: TextStyle(fontSize: TEXT_FIELD_INPUT_FONT_SIZE),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: APP_PRIMARY_COLOR),
                ),
                suffixIcon: Visibility(
                  visible: _textFieldController.text.isNotEmpty,
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                      ),
                      onPressed: () {
                        clearField();
                      }),
                ),
              ),
            ),
            data: Theme.of(context).copyWith(
              primaryColor: APP_PRIMARY_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
