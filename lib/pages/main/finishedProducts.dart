import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mes_mobile_client/pages/main/leftmenu.dart';

class FinishProducts extends StatefulWidget {
  @override
  TabThreeState createState() => new TabThreeState();
}
class TabThreeState extends State<FinishProducts>{
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: PreferredSize(
            child: AppBar(
                title: new Text("成品库手机客户端", style: new TextStyle(
                    color: Colors.white, fontSize: 13.0),), backgroundColor: Colors.cyan
            ),
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
        drawer: new LeftMenu(),
        body:new Container(
          margin: EdgeInsets.only(top:20),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget>[new Container(
                    color: Color.fromRGBO(35, 127, 127, 0.7),
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(20,0,30,20),
                    child:new FlatButton(
                        disabledColor: Colors.blue,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            '成品入库',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                        ))
                ), new Container(
                    color: Color.fromRGBO(35, 127, 127, 0.7),
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(10,0,20,20),
                    child: new FlatButton(
                        disabledColor: Colors.blue,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new Setting()));*/
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            '销售出库',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                        ))
                )


                ],
              ),
              new Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget>[new Container(
                    color: Color.fromRGBO(35, 127, 127, 0.7),
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(20,0,30,20),
                    child:new FlatButton(
                        disabledColor: Colors.blue,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            '货位调整',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                        ))
                ), new Container(
                    color: Color.fromRGBO(35, 127, 127, 0.7),
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(10,0,20,20),
                    child: new FlatButton(
                        disabledColor: Colors.blue,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new Setting()));*/
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            '库存盘点',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                        ))
                )


                ],
              ),
              new Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget>[new Container(
                    color: Color.fromRGBO(35, 127, 127, 0.7),
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(20,0,30,20),
                    child:new FlatButton(
                        disabledColor: Colors.blue,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            '货位调整',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                        ))
                ), new Container(
                    color: Color.fromRGBO(35, 127, 127, 0.7),
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(10,0,20,20),
                    child: new FlatButton(
                        disabledColor: Colors.blue,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new Setting()));*/
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            'XXXX',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                        ))
                )


                ],
              )
            ],
          ),
        )
      ),
    );
  }
}