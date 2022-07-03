import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function _buttonPressed;

  TextControl(this._buttonPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: _buttonPressed,
      child: Text('Press button'),
    );
  }
}
