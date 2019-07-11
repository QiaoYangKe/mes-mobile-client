import 'package:flutter/material.dart';
import 'package:mes_mobile_client/pages/main/tab1.dart';
import 'package:mes_mobile_client/pages/main/tab2.dart';
import 'package:mes_mobile_client/pages/main/tab3.dart';
import 'package:mes_mobile_client/pages/main/leftmenu.dart';
import 'package:mes_mobile_client/pages/appHome.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("mes-mobile-client"), backgroundColor: Colors.redAccent,),  //头部的标题AppBar
      drawer: new LeftMenu(),  //侧边栏按钮Drawer
      body: new Center(  //中央内容部分body
        child: new AppHome()
      ),
    );
  }
}