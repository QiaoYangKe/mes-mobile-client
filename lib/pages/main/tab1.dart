import 'package:flutter/material.dart';

class TabOne extends StatefulWidget {
  @override
  TabOneState createState() => new TabOneState();
}
class TabOneState extends State<TabOne>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('tab1'),
        ),
      ),
    );
  }
}