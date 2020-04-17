import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';

import 'RScanCameraDialog.dart';
import 'RScanDialog.dart';

class ScanWidget extends StatefulWidget {
  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  RScanResult result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('扫码结果：${result == null ? '等待结果中' : '扫码结果${result.toString()
                .split(',')
                .join('\n')}'}')
            ,
             FlatButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RScanCameraDialog()));
                setState(() {
                  this.result = result;
                });
              },
              child: Text('RScanCamera开始扫码'),
            ),

            FlatButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RScanDialog()));
                setState(() {
                  this.result = result;
                });
              },
              child: Text('RScanDialog'),
            ),
          ],
        ),
    );
  }
}




