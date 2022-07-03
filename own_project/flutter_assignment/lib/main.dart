import 'package:flutter/material.dart';
import './TextOutput.dart';
import './TextControl.dart';

void main() {
  runApp(AssignmentApp());
}

class AssignmentApp extends StatefulWidget {
  @override
  State<AssignmentApp> createState() => _AssignmentAppState();
}

int _buttonClicked = 0;
String _dataToShow = 'Button not clicked';

class _AssignmentAppState extends State<AssignmentApp> {
  void _onButtonPressed() {
    setState(() {
      _buttonClicked += 1;
      _dataToShow = "Button clicked $_buttonClicked times";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Assignment 1'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextOutput(_dataToShow),
              TextControl(_onButtonPressed)
            ],
          ),
        ),
      ),
    );
  }
}
