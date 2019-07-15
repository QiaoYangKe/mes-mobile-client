/**
 * APP的带有tab的主页面
 */

import 'package:flutter/material.dart';

import 'package:mes_mobile_client/pages/main/tab1.dart';
import 'package:mes_mobile_client/pages/main/tab2.dart';
import 'package:mes_mobile_client/pages/main/finishedProducts.dart';

void main() {
  runApp(new AppHome());
}

class AppHome extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<AppHome> with SingleTickerProviderStateMixin {
  TabController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
/*    eventBus.on<EventOpenDrawer>().listen((EventOpenDrawer data) {
      if (data.flag) _scaffoldKey.currentState.openDrawer();
    });*/
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new TabOne(),
            new TabTwo(),
            new FinishProducts(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              new Tab(
                text: "tab1",
                icon: new Icon(Icons.brightness_5),
              ),
              new Tab(
                text: "tab2",
                icon: new Icon(Icons.map),
              ),
              new Tab(
                text: "成品库",
                icon: new Icon(Icons.directions_run),
              ),
            ],
          ),
        ),
      ),
    );
  }
}