import 'dart:async';

import 'package:mes_mobile_client/download_progress_dialog.dart';
import 'package:mes_mobile_client/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:collection';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io'; //网络请求
import 'dart:convert'; //数据解析

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '应用内升级demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '应用内升级demo'),
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
  var serviceVersion = '';
  int progress = 0;
  Map map = new HashMap();
  var show = true;
  var isCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData_sys_get();
    map['data'] = '1.新增app应用内升级\n2.修复若干个bug';
    map['ver'] = serviceVersion;
    map['url'] = 'http://10.1.10.49:8080/update.apk';
//    check();
  }

  Widget buildGrid() {
    Widget content;
    if (isCheck) {
      content = new AlertDialog(
        title: Text('发现新版本'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(serviceVersion),
              Text(''),
              Text('更新内容'),
              Text(map['data']),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          FlatButton(
              child: Text('确认'),
              onPressed: () => doUpdate(serviceVersion, map['url'])),
        ],
      );
    } else {
      content = new Text("login");
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
      children:<Widget>[
        new Offstage(
        offstage: false, //这里控制
        child:Visibility(
          visible:show,
          child: AlertDialog(
              title: Text('检查要不要更新中'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(serviceVersion),
                    Text(''),
                    Text('检查中 $progress%'),
                  ]),)),
        ),
      ),
        new Container(child: buildGrid())
      ]
    ));
  }

  //获取服务器上的版本
  Future<Map> loadData_sys_get() async {
    print('------loadData_sys_get--------');
    var httpClient = new HttpClient();
// uri方法1
    Uri uri = Uri(
        scheme: 'http', host: '10.1.10.49', port: 8080, path: '/version.json');
    var request = await httpClient.getUrl(uri);
    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    headers['useVersion'] = '3.1.0';
    headers['isEncoded'] = '1';
    headers['bundleId'] = 'com.nongfadai.iospro';
    request.headers.add("loginSource", "IOS");
    request.headers.add("useVersion", "3.1.0");
    request.headers.add("isEncoded", "1");
    request.headers.add("bundleId", "com.nongfadai.iospro");
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    if (response.statusCode == HttpStatus.ok) {
      Map data = jsonDecode(responseBody);
      print(data);
      this.setState(() {
        serviceVersion = data['version'];
      });
      checkUpdate();
    } else {
      return null;
    }
  }

  Future checkUpdate() async {
    setState(() => this.progress = 10);
    //获取当前版本
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() => this.progress = 20);
    //获取服务器上最新版本
    setState(() => this.progress = 30);
    //判断如果服务器上版本比当前版本新,则返回最新版本信息
    if (version != serviceVersion) {
      setState(() => this.progress = 100);
      Fluttertoast.showToast(msg: "最新版本:" + serviceVersion);
      this.setState(() {
        show = false;
        isCheck = true;
      });
    } else {
      setState(() => this.progress = 100);
      Fluttertoast.showToast(msg: "此时就是当前最新版本");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Login()),
            (Route<dynamic> route) => false,
      );
    }
  }

  ///显示更新内容
  ///[version] 最新版本号
  ///[data] 更新内容
  Future<void> showUpdate(String version, String data, String url) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('发现新版本'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(version),
                Text(''),
                Text('更新内容'),
                Text(data),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            FlatButton(
              child: Text('确认'),
              onPressed: () => doUpdate(version, url),
            ),
          ],
        );
      },
    );
  }
  ///执行更新操作
  ///[version] 最新版本号
  doUpdate(String version, String url) async {
    //关闭更新内容提示框
    Navigator.of(context).pop();
//    //获取权限
//    var per = await checkPermission();
//    if(per != null && !per){
//      return null;
//    }
    //开始更新
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: DownloadProgressDialog(version, url),
    );
  }

//检查是否有权限
  Future<bool> checkPermission() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          Fluttertoast.showToast(msg: "获取权限成功");
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    Fluttertoast.showToast(msg: "获取权限失败");
    return false;
  }
}
