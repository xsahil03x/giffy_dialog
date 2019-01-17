import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giffy Dialog Demo',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Nunito'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giffy Dialog Example'),
      ),
      body: Center(
        child: RaisedButton(
            color: Colors.teal,
            child: Text(
              'Press Me',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) =>
                      NetworkGiffyDialog(imageUrl: null, title: null));
            }),
      ),
    );
  }
}
