import 'package:flutter/material.dart';
import 'package:mes_mobile_client/pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
var ipController = new TextEditingController();
var ip = ipController.text;
var newIp = '';
class Setting extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IP设置',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'IP设置'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    get();
  }

  save() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ip', ip);
  }

  Future<String> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newIp = await prefs.getString('ip');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              // textDirection:,
              textBaseline: TextBaseline.alphabetic,
              //[]里面填入子元素，也就是控件
              children: <Widget>[
                new Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(96, 96, 96, 0.7)),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          //控制器
                          controller: ipController,
                          maxLength: 11,
                          maxLines: 1,
                          //是否自动更正
                          autocorrect: true,
                          //是否自动对焦
                          //              autofocus: true,
                          decoration: new InputDecoration(
                            //                hintText: "请输入用户名",
                            labelText: "ip服务器",
                             hintText: newIp,
                            helperText: "点击输入栏获取原ip配置"
                          ),
                          onChanged: (text) {
                            //内容改变的回调
                            print('change $text');
                          },
                          onSubmitted: (text) {
                            //内容提交(按回车)的回调
                            print('submit $text');
                          },
                        ),
                      ),
                      new Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: <Widget>[new Container(
                            color: Color.fromRGBO(35, 127, 127, 0.7),
                            height: 30,
                            width: 120,
                            margin: EdgeInsets.fromLTRB(10,0,10,20),
                            child:new FlatButton(
                                disabledColor: Colors.blue,
                                disabledTextColor: Colors.black,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          new Login()));
                                },
                                child: new Padding(
                                  padding: new EdgeInsets.all(5.0),
                                  child: new Text(
                                    '返回',
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ))
                        ), new Container(
                            color: Color.fromRGBO(35, 127, 127, 0.7),
                            height: 30,
                            width: 120,
                            margin: EdgeInsets.fromLTRB(10,0,10,20),
                            child: new FlatButton(
                                disabledColor: Colors.blue,
                                disabledTextColor: Colors.black,
                                onPressed: () {
                                  this.save();
                                },
                                child: new Padding(
                                  padding: new EdgeInsets.all(5.0),
                                  child: new Text(
                                    '保存',
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ))
                        )
                        ],
                      )],
                  ),
                )
              ])),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
