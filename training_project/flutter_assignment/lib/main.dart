import 'package:flutter/material.dart';
import './TextOutput.dart';
import './TextControl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

int _buttonClicked = 0;
String _textToTextView = 'Button not clicked';

class _MyAppState extends State<MyApp> {
  void _buttonPressed() {
    setState(() {
      _buttonClicked += 1;
      _textToTextView = "Button clicked $_buttonClicked times";
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
              TextOutput(_textToTextView),
              TextControl(_buttonPressed)
            ],
          ),
        ),
      ),
    );
  }
}
