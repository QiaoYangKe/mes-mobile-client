import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mes_mobile_client/pages/appHome.dart';
import 'package:mes_mobile_client/pages/homePage.dart';

void main() => runApp(MyApp());
var usernameController = new TextEditingController();
var userPwdController = new TextEditingController();
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      appBar: new AppBar(
        title: new Text('Login'),
        iconTheme: new IconThemeData(color: Colors.red),
        //文字title居中
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: new Column(
            //MainAxisSize在主轴方向占有空间的值，默认是max。还有一个min
              mainAxisSize: MainAxisSize.max,
              //MainAxisAlignment：主轴方向上的对齐方式，会对child的位置起作用，默认是start。
              mainAxisAlignment: MainAxisAlignment.start,
              //[]里面填入子元素，也就是控件
              children: <Widget>[Padding(
                  padding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                  child: Container(
                    //本地图片
                    child: new Image.asset(
                      'images/timg.jpg',
                      scale: 1.0,
                    ),
                    width: 300.0,
                    height: 200.0,
                    //                color: Colors.lightBlue,
                  )),Padding(
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
                  //              autofocus: true,
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
              ),Padding(
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
              ),Container(
                //这里写800已经超出屏幕了，可以理解为match_parent
                width: 800.0,
                margin: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //类似cardview
                child: new Card(
                  color: Colors.blueAccent,
                  elevation: 5.0,
                  //按钮
                  child: new FlatButton(
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
                                  content: Text(usernameController.text +
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
                                                  new HomePage()));
                                        },
                                        child: Text("确定")),
                                  ],
                                );
                              });
                        }
                      },
                      child: new Padding(
                        padding: new EdgeInsets.all(10.0),
                        child: new Text(
                          '登录',
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                      )),
                ),
              )]
          )
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
