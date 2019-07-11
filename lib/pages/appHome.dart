/**
 * APP的主入口文件
 */

import 'package:flutter/material.dart';

import 'package:mes_mobile_client/pages/main/tab1.dart';
import 'package:mes_mobile_client/pages/main/tab2.dart';
import 'package:mes_mobile_client/pages/main/tab3.dart';
import 'package:mes_mobile_client/pages/main/leftmenu.dart';
import 'package:mes_mobile_client/pages/common/eventBus.dart';

//果核的主界面
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
        key: _scaffoldKey,
        drawer: new LeftMenu(),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new TabOne(),
            new TabTwo(),
            new TabThree(),
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
                text: "tab3",
                icon: new Icon(Icons.directions_run),
              ),
            ],
          ),
        ),
      ),
    );
  }
}