import 'package:flutter/material.dart';

class TabThree extends StatefulWidget {
  @override
  TabThreeState createState() => new TabThreeState();
}
class TabThreeState extends State<TabThree>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('tab3'),
        ),
      ),
    );
  }
}