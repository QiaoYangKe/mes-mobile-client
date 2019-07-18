import 'package:flutter/material.dart';
import 'dart:io';//网络请求
import 'dart:convert';//数据解析
import 'package:dio/dio.dart';


class TabOne extends StatefulWidget {
  @override
  TabOneState createState() => new TabOneState();
}
class TabOneState extends State<TabOne>{
  List listDemo;
  var str ='等待中';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listDemo = [
    {"label": '车牌号',"children":[{"label":'aaa',"children":[]}]},
    {"label": '所有人',"children":[{"label":'aaa',"children":[]}]},
    {"label": '号牌颜色',"children":[{"label":'aaa',"children":[]}]}];
  }


// 1.1 HttpClient - get （疑问？queryParameters仅仅用在get请求吗）
  void loadData_sys_get() async {
    print('------loadData_sys_get--------');

    var httpClient = new HttpClient();
    var params = Map<String, String>();
// uri方法1
    Uri uri =
    Uri(scheme: 'http', host: '10.1.10.30',port: 8080, path: '/api/basedata/material/getMaterialClass');

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
      print('请求头：${response.headers}');
      print('111请求成功代发数据为:\n $responseBody');
      print('--------------');
      Map data = jsonDecode(responseBody);
      data.forEach((key, value) {
        if(key == 'result') {
          setState(() {
            listDemo = value;
          });
        }
      });
      print( '222请求成功代发数据为:\n $data');
      print( '4444请求成功代发数据为:\n $listDemo');

    } else {
      str='\n\n\n11111==请求失败${response.statusCode}';
    }
  }
  void loadData_dio_get() async {
    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    headers['useVersion'] = '3.1.0';
    headers['isEncoded'] = '1';
    headers['bundleId'] = 'com.nongfadai.iospro';
    headers['Content-Type'] = 'application/json';

    Dio dio = Dio();
    dio.options.headers.addAll(headers);
    dio.options.baseUrl = 'http://10.1.10.30:8080';

    Response response = await dio.get('/api/basedata/material/getMaterialClass');

    if (response.statusCode == HttpStatus.ok) {
      print(response.headers);
      print(response.data);
    }
    setState(() {
      str = response.data.toString();
    });
  }

  Widget buildGrid() {
    List<Widget> titles = [];
    Widget content;
    for(var item in listDemo) {
      titles.add(
          new Column(
            children: <Widget>[
              new Text(item['label']),
              new Padding(padding: EdgeInsets.all(5),
              child:new Text('aa'),)
            ],
          )
      );
    }
    content = new Column(
        children: titles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: Column(
            children: <Widget>[
              new MaterialButton(
                onPressed: () {
                  this.loadData_sys_get();
                },
                child: Text('自带 http'),
              ), new MaterialButton(
                onPressed: () {
                  this.loadData_dio_get();
                },
                child: Text('dio http'),
              ),new MaterialButton(
                onPressed: () {
                  setState(() {
                    str = '';
                  });
                },
                child: Text('清空'),
              ),
              new Text(str),
              new Padding(padding: EdgeInsets.all(2),child: buildGrid(),)
            ],
          )
        ),
      ),
    );
  }

}