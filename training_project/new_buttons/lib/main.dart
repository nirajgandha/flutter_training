import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              child: Text('A raised button'),
              onPressed: () {
                print('pressed raised button');
              },
            ),
            TextButton(
              child: Text('A flat button'),
              style: TextButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                print('pressed flat button');
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
