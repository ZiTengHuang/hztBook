import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_lottie/flutter_lottie.dart';

class FangyePage extends StatefulWidget {
  @override
  _FangyePageState createState() => _FangyePageState();
}

class _FangyePageState extends State<FangyePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WithdrawalAccountItem(),
        ],
      ),
    );
  }
}

class WithdrawalAccountItem extends StatefulWidget {
  const WithdrawalAccountItem({
    Key key,
    this.onLongPress,
  }) : super(key: key);

  final GestureLongPressCallback onLongPress;

  @override
  _WithdrawalAccountItemState createState() => _WithdrawalAccountItemState();
}

/// 3D翻转动画 https://medium.com/flutterpub/flutter-flip-card-animation-with-3d-effect-4284af04f5a
class _WithdrawalAccountItemState extends State<WithdrawalAccountItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  bool showLottie = true;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 22.0, right: 22.0),
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(pi * _animation.value),
        child: AccountCard(
          type: 1,
          child: InkWell(
            // 长按删除账号
            onLongPress: () => widget.onLongPress(),
            onTap: () {
              if (_animationStatus == AnimationStatus.dismissed) {
                _animationController.forward();
                Future.delayed(new Duration(milliseconds: 50),(){
                  setState(() {
                    showLottie =false;
                  });
                });
              } else {
                _animationController.reverse();
 

              }
            },
            child: _animation.value <= 0.5
                ? Stack(
                    children: <Widget>[

                      showLottie ? Align(
                        alignment: Alignment.centerLeft,
                        child:    Container(
                          width:100,
                          child: LottieView.fromFile(
                            onViewCreated: (e) {},
                            filePath: "assets/images/15998-flip-card.json",
                            autoPlay: true,
                            loop: true,
                            reverse: true,
                          ),
                        ),
                      ):SizedBox(),
                      Align(
                        alignment: Alignment.center,
                        child: Text('计算完成点击查看结果',style: TextStyle(color: Colors.white,fontSize: 22),),
                      ),


                    ],
                  )
                : Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.6, color: Colors.white),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Transform(
                          // 文字翻转，保证文字的方向
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateX(pi),
                          child: ScrollerMoney(
                            money: 100.00,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class AccountCard extends StatefulWidget {
  const AccountCard({Key key, @required this.child, this.type})
      : super(key: key);

  final Widget child;
  final int type;

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: widget.type == 1
                    ? const Color(0x804EE07A)
                    : const Color(0x805793FA),
                offset: Offset(0.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 0.0),
          ],
          gradient: LinearGradient(
              colors: widget.type == 1
                  ? const [Color(0xFF40E6AE), Color(0xFF2DE062)]
                  : const [Color(0xFF57C4FA), Colors.white])),
      child: widget.child,
    );
  }
}

class ScrollerMoney extends StatefulWidget {
  final double money;
  final Function function;

  const ScrollerMoney({Key key, @required this.money, this.function})
      : super(key: key);

  @override
  _ScrollerMoneyState createState() => _ScrollerMoneyState();
}

class _ScrollerMoneyState extends State<ScrollerMoney>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationScroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animationScroller = Tween<double>(begin: 0.0, end: widget.money)
        .animate(_animationController);
    _animationScroller.addListener(() {
      setState(() {});
    });

    Future.delayed(Duration(seconds: 1), () {
      _animationController.forward();
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      null == _animationScroller
          ? '0%'
          : '${_animationScroller.value.toStringAsFixed(2) ?? ''}%',
      style: TextStyle(fontSize: 22, color: Colors.redAccent),
    );
  }
}
