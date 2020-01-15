import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/widget/provide/offsetNotifier.dart';
import 'dart:math' as math;

class Samurai extends StatefulWidget {
  @override
  _SamuraiState createState() => _SamuraiState();
}

class _SamuraiState extends State<Samurai> {
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
                    return Transform.scale(
                      scale: math.max(0, 1 - notifier.page),
                      child: Opacity(
                        opacity: math.max(0, 1 - notifier.page),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    width: 340,
                    height: 340,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    return Transform.rotate(
                      angle: math.max(0, (math.pi / 3) * 4 * notifier.page),
                      child: child,
                    );
                  },
                  child: Image.asset('assets/images/wufu/cai.png',height: 400,width: 240,fit: BoxFit.fill,),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<OffsetNotifier>(
            builder: (context, notifier, child) {
              return Opacity(
                opacity: math.max(0, 1 - 3 * notifier.page),
                child: child,
              );
            },
            child: Column(
              children: <Widget>[
                Text('牛逼的五福金牌',style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w800
                ),),
                SizedBox(
                  height: 15,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 22),child:
                  Text('牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛'
                      '逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五'
                      '福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌'
                      '牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌'
                      '牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌牛逼的五福金牌',style: TextStyle(
                     fontSize: 13,
                    color: Colors.grey
                  ),),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
