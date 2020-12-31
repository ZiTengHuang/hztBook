import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';

class DartBasic extends StatefulWidget {
  @override
  _DartBasicState createState() => _DartBasicState();
}

class _DartBasicState extends State<DartBasic> {
  List listA = [
    'A',
    'A',
    'B',
    'B',
    'D',
    'C',
    'A',
    'D',
  ];

  @override
  Widget build(BuildContext context) {
    _mapKey();
    return Scaffold(
      appBar: AppTitleBar(context: context, title: 'dart基础'),
      body: Column(
        children: <Widget>[
          RichText(
              text: TextSpan(children: [
            TextSpan(text: '仔细看可以同一条text换行', style: TextStyle(color: Colors.blue)),
            TextSpan(
                text: 'sdffffffffsdffssdddddddddddddddddddddddddddddddffffff'
                    .replaceAll("", "\u{200B}"),
                style: TextStyle(color: Colors.grey)),
          ])),
          Text('观看日志输出'),
        ],
      ),
    );
  }

  _listType() {
    List list = [1, 2, 3, "22", "A"];
    for (var val in list) {
      print('list: ${val}');
    }

    list.forEach((covariant) {
      print("forEach:${covariant}");
    });
  }

  _mapKey() {
    Map names = {'name': '小明', 'name2': '小黄'};
    Map niubis;
    niubis = {'nimabi': '日哦'};
    niubis['tianna'] = 15;
    niubis['tianna2'] = 16;
    names.forEach((k, v) {
      print(names[k]);
    });

    ///颠倒这niubis 这组map
    print(niubis.map((k, v) {
      return MapEntry(v, k);
    }));

    listA.map((a) {
      print(a);
    });

    List sortList = [];
    Map sortMap = {};
    listA.forEach((value) {
      String key = value;
      if (sortMap.keys.toString().contains(key)) {
        sortMap[value] = sortMap[value] + 1;
      } else {
        sortMap[value] = 1;
      }
    });
    print("hahahaha $sortMap");
  }
}
