import 'package:flutter/material.dart';

void main() {
  runApp(NewButtonsApp());
}

class NewButtonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('New Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: Text('An elevated button'),
              onPressed: () {
                print('pressed elevated button');
              },
            ),
            TextButton(
              child: Text('A Text button'),
              style: TextButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                print('pressed text button');
              },
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.orange,
                side: BorderSide(color: Colors.orange),
              ),
              child: Text('An Outline Button'),
              onPressed: () {
                print('pressed outline button');
              },
            )
          ],
        ),
      ),
    ));
  }
}
