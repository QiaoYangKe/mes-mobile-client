import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class BatteryPage extends StatefulWidget {
  @override
  _BatteryPageState createState() {
    return new _BatteryPageState();
  }
}

class _BatteryPageState extends State<BatteryPage> {
  String _batteryLevel = '在搜索中';

  static const platform = const MethodChannel('samples.flutter.dev/battery');

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              onPressed: () {
                this._getBatteryLevel();
              },
              child: new Text('Get Battery Level'),
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
