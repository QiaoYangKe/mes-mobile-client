import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mes_mobile_client/pages/main/finishedProducts.dart';
import 'package:mes_mobile_client/pages/login/setting.dart';
import 'package:flutter/services.dart';

void main() => runApp(Login());
var usernameController = new TextEditingController();
var userPwdController = new TextEditingController();

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '明泰'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundLogin.jpg"),
                fit: BoxFit.cover),
          ),
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
                        //用户名输入框
                        child: TextField(
                          //控制器
                          controller: usernameController,
                          maxLength: 11,
                          maxLines: 1,
                          //是否自动更正
                          autocorrect: true,
                          //是否自动对焦
                          autofocus: true,
                          decoration: new InputDecoration(
                            //                hintText: "请输入用户名",
                            labelText: "请输入用户名",
                            helperText: "用户名",
                            icon: new Icon(Icons.account_box),
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
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          //控制器
                          controller: userPwdController,
                          maxLength: 11,
                          maxLines: 1,
                          //是否是密码
                          obscureText: true,
//输入类型(这个属性不一定非要这样，这里写出来只是说有这个东西)
                          keyboardType: TextInputType.number,
                          //是否自动更正
                          autocorrect: true,
                          //是否自动对焦
                          //              autofocus: true,
                          decoration: new InputDecoration(
                            //                hintText: "请输入用户名",
                            labelText: "请输入密码",
                            helperText: "密码",
                            icon: new Icon(Icons.account_box),
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
                          new Row(children: <Widget>[
                            new Expanded(child: new Container(
                              height: 30,
                              width:300,
                              color: Color.fromRGBO(35, 127, 127, 0.7),
                              margin: EdgeInsets.fromLTRB(10,10,10,10),
                              child: FlatButton(
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  onPressed: () {
                                    if (usernameController.text.isEmpty) {
                                      //第三方的插件Toast，https://pub.dartlang.org/packages/fluttertoast
                                      Fluttertoast.showToast(
                                          msg: "用户名不能为空哦",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black);
                                    } else if (userPwdController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "密码不能为空哦",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black);
                                    } else {
                                      //弹出对话框，里面写着账号和密码
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              title: Text("对话框"),
                                              content: Text(
                                                  usernameController.text +
                                                      "\n" +
                                                      userPwdController.text),
                                              actions: <Widget>[
                                                //对话框里面的两个按钮
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Text("取消")),
                                                FlatButton(
                                                  //点击确定跳转到下一个界面，也就是HomePage
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                              new FinishProducts()));
                                                    },
                                                    child: Text("确定")),
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: new Padding(
                                    padding: new EdgeInsets.all(5.0),
                                    child: new Text(
                                      '登录',
                                      style: new TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  )),
                            )),
                          ]),
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
                                      SystemNavigator.pop();
                                    },
                                    child: new Padding(
                                      padding: new EdgeInsets.all(5.0),
                                      child: new Text(
                                        '退出',
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              new Setting()));
                                    },
                                    child: new Padding(
                                      padding: new EdgeInsets.all(5.0),
                                      child: new Text(
                                        '设置',
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
