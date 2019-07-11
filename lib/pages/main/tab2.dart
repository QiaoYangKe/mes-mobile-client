import 'package:flutter/material.dart';

class TabTwo extends StatefulWidget {
  @override
  TabTwoState createState() => new TabTwoState();
}
class TabTwoState extends State<TabTwo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('tab2'),
        ),
      ),
    );
  }
}