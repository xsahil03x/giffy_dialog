import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

void main() => runApp(new MyApp());

const List<Key> keys = [
  Key("Network"),
  Key("NetworkDialog"),
  Key("Flare"),
  Key("FlareDialog"),
  Key("Asset"),
  Key("AssetDialog")
];

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                key: keys[0],
                color: Colors.teal,
                child: Text(
                  'Network Giffy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                            key: keys[1],
                            image: Image.network(
                              "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Granny Eating Chocolate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'This is a granny eating chocolate dialog box. This library helps you easily create fancy giffy dialog.',
                              textAlign: TextAlign.center,
                            ),
                            onOkButtonPressed: () {},
                          ));
                }),
            RaisedButton(
                key: keys[2],
                color: Colors.teal,
                child: Text(
                  'Flare Giffy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => FlareGiffyDialog(
                            key: keys[3],
                            flarePath: 'assets/space_demo.flr',
                            flareAnimation: 'loading',
                            title: Text(
                              'Space Reloading',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'This is a space reloading dialog box. This library helps you easily create fancy flare dialog.',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                            onOkButtonPressed: () {},
                          ));
                }),
            RaisedButton(
                key: keys[4],
                color: Colors.teal,
                child: Text(
                  'Asset Giffy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AssetGiffyDialog(
                            key: keys[5],
                            image: Image.asset(
                              'assets/men_wearing_jacket.gif',
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Men Wearing Jackets',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'This is a men wearing jackets dialog box. This library helps you easily create fancy giffy dialog.',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                            onOkButtonPressed: () {},
                          ));
                }),
          ],
        ),
      ),
    );
  }
}
