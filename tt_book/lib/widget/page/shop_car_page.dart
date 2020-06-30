import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sent();
  }

  sent() async {
    await getHttp(1).then((value) => print(value));
    await getHttp(2).then((value) => print(value));
    await getHttp(3).then((value) => print(value));
    await getHttp(4).then((value) => print(value));
    print('应该在4后面初心');
    await getHttp(5).then((value) => print(value));
    await getHttp(6).then((value) => print(value));
    await getHttp(7).then((value) => print(value));
    await getHttp(8).then((value) => print(value));
    print('按照顺序执行完毕');
  }

  Future getHttp(int i) {
    for (int i = 0; i <= 10000; i++) {}
    return Future.value(i);   
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCustomContainer(),
        _buildCustomContainer(),
        _buildCustomContainer(),
        _buildCustomContainer(),
        _buildCustomContainer(),
        _buildCustomContainer(),
        _buildCustomContainer(),
      ],
    );
  }

  _buildCustomContainer() {
    final Widget widget = Container(
      color: Color.fromARGB(255, math.Random.secure().nextInt(255),
          math.Random.secure().nextInt(255), math.Random.secure().nextInt(255)),
      height: 40,
      width: double.infinity,
    );
    return widget;
  }
}
