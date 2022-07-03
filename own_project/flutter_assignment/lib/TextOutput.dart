import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String _dataToShow;

  TextOutput(this._dataToShow);

  @override
  Widget build(BuildContext context) {
    return Text(
      _dataToShow,
      style: TextStyle(
          color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
