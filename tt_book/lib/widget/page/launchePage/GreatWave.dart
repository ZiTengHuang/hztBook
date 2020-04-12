import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
import 'package:tt_book/widget/provide/offsetNotifier.dart';

class GreatWave extends StatefulWidget {
  @override
  _GreatWaveState createState() => _GreatWaveState();
}

class _GreatWaveState extends State<GreatWave> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 500,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
//                  print(notifier.page);
                    return Transform.scale(
                      scale: math.max(0, 1 - (1 - (4 * notifier.page - 7))),
                      child: child,
                    );
                  },
                  child: Container(
                    width: 340,
                    height: 340,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ),
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.translationValues(
                          0, 100 * (1 - (4 * notifier.page - 7)), 0)
                        ..rotateZ((-math.pi / 2) * 2 * notifier.page),
                      child: child,
                    );
                  },
                  child: Image.asset('assets/images/wufu/cai.png',height: 400,width: 240,fit: BoxFit.fill,),
                ),
              ],
            ),
          ),
          Consumer<OffsetNotifier>(
            builder: (context, notifier, child) {
              return Transform.translate(
                offset: Offset(0, 50 * (1 - (4 * notifier.page - 7))),
                child: child,
              );
            },
            child: Column(
              children: <Widget>[
                Text(
                  '牛逼的五福金牌',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                ),
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    return Opacity(
                      opacity: math.max(0, 4 * notifier.page - 7),
                      child: child,
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      '牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛'
                      '逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五'
                      '福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌'
                      '牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌'
                      '牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
