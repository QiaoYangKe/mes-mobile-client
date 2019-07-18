import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mes_mobile_client/pages/main/BatteryPage.dart';
//左侧菜单栏
class LeftMenu extends Drawer {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      //侧边栏按钮Drawer
      child: new ListView(
        children: <Widget>[
          new Container(
              color: Color.fromRGBO(35, 127, 127, 0.7),
              child: new Padding(
                padding: new EdgeInsets.all(5.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        //头像
                        new Container(
                          width: 80.0,
                          height: 80.0,
                          margin:
                          new EdgeInsets.only(right: 50.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/backgroundLogin.jpg"),
                              //从Assets加载图片
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              '做不了',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            new Text(
                              '135********',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    ),
                    new Text(
                      "河南明泰信息中心",
                      style: new TextStyle(color: Colors.white, fontSize: 18.0),
                    )
                  ],
                ),
              )),
          new ListTile(
            //第二个功能项
              title: new Text('电量'),
              leading: new Icon(Icons.accessibility),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        new BatteryPage()));
              }),
          new ListTile(
            //第二个功能项
              title: new Text('扫码'),
              leading: new Icon(Icons.accessibility),
              onTap: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) =>
//                        new Code()));
              }),
          new ListTile(
            //第二个功能项
              title: new Text('退出系统'),
              leading: new Icon(Icons.accessibility),
              onTap: () {
               SystemNavigator.pop();
              }),
          //分割线控件
        ],
      ),
    );
  }
}