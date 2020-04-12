import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/widget/provide/offsetNotifier.dart';
import 'dart:math' as math;

class Reject extends StatefulWidget {
  @override
  _RejectState createState() => _RejectState();
}

class _RejectState extends State<Reject> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    double multiple;
                    if (notifier.page <= 1.0) {
                      multiple = math.max(0, 4 * notifier.page - 3);
                    } else {
                      multiple = math.max(0, 1 - (4 * notifier.page - 4));
                    }
                    return Transform.scale(
                      scale: multiple,
                      child: child,
                    );
                  },
                  child: Container(
                    height: 340,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    double multiple;
                    if (notifier.page <= 1.0) {
                      multiple = math.max(0, 4 * notifier.page - 3);
                    } else {
                      multiple = math.max(0, 1 - (4 * notifier.page - 4));
                    }
                    return Transform.translate(
                      offset: Offset(0, -50 * (1 - multiple)),
                      child: Opacity(
                        opacity: multiple,
                        child: child,
                      ),
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
              double multiple;
              if (notifier.page <= 1.0) {
                multiple = math.max(0, 4 * notifier.page - 3);
              } else {
                multiple = math.max(0, 1 - (4 * notifier.page - 4));
              }
              return Transform.translate(
                offset: Offset(0, -50 * (1 - multiple)),
                child: Opacity(
                  opacity: multiple,
                  child: child,
                ),
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
