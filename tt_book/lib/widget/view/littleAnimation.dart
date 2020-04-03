import 'package:flutter/material.dart';

class LittleAnimation extends StatefulWidget {
  @override
  _LittleAnimationState createState() => _LittleAnimationState();
}

class _LittleAnimationState extends State<LittleAnimation> {
  bool show1 = false;
  bool show2 = false;
  bool show3 = false;
  bool show4 = false;
  bool show5 = false;
  bool show6 = false;
  bool show7 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        show1 = true;
      });
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        show2 = true;
      });
    });
    Future.delayed(Duration(milliseconds: 4500), () {
      setState(() {
        show3 = true;
      });
    });    Future.delayed(Duration(milliseconds: 6000), () {
      setState(() {
        show4 = true;
      });
    });    Future.delayed(Duration(milliseconds: 7500), () {
      setState(() {
        show5 = true;
      });
    });    Future.delayed(Duration(milliseconds: 9000), () {
      setState(() {
        show6 = true;
      });
    });    Future.delayed(Duration(milliseconds: 10000), () {
      setState(() {
        show7 = true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          show1 ?   FateWidget2(): SizedBox(),
          show2 ?   FateWidget2(): SizedBox(),
          show3 ?   FateWidget2(): SizedBox(),
          show4 ?   FateWidget2(): SizedBox(),
          show5 ?   FateWidget2(): SizedBox(),
          show6 ?   FateWidget2(): SizedBox(),
          show7 ?   FateWidget2(): SizedBox(),
        ],
      ),
    );
  }

  _animationWidgets() {
    List<Widget> lists = [];
    lists.add(FateWidget(
      duration: 2000,
    ));
    lists.add(
      SizedBox(
        height: 40,
      ),
    );
    lists.add(FateWidget(
      duration: 3000,
    ));
    lists.add(
      SizedBox(
        height: 40,
      ),
    );
    lists.add(FateWidget(
      duration: 4000,
    ));
    lists.add(
      SizedBox(
        height: 40,
      ),
    );
    lists.add(FateWidget(
      duration: 5000,
    ));
    lists.add(
      SizedBox(
        height: 40,
      ),
    );
    lists.add(FateWidget(
      duration: 6000,
    ));
    lists.add(FateWidget(
      duration: 7000,
    ));
    lists.add(FateWidget(
      duration: 8000,
    ));
    lists.add(FateWidget(
      duration: 9000,
    ));

    return lists;
  }

  _animationWidgets3() {
    List<Widget> lists = [];
    lists.add(BounceAnimation(
      endNum: 2000.00,
    ));
    lists.add(BounceAnimation(
      endNum: 1400.10,
    ));
    lists.add(BounceAnimation(
      endNum: 4444.00,
    ));
    lists.add(BounceAnimation(
      endNum: 55555.00,
    ));
    lists.add(BounceAnimation(
      endNum: 12352.00,
    ));
    lists.add(BounceAnimation(
      endNum: 252323.00,
    ));
    lists.add(BounceAnimation(
      endNum: 245245.12,
    ));

    return lists;
  }

//  _animationWidgets4() {
//    List<Widget> lists = [];
//    lists.add(FateWidget2(
//      delay: 0,
//    ));     lists.add(FateWidget2(
//      delay: 2000,
//    ));     lists.add(FateWidget2(
//      delay: 4000,
//    ));     lists.add(FateWidget2(
//      delay: 6000,
//    ));
//
//    return lists;
//  }

//  _animationWidgets2() {
//    List<Widget> lists = [];
//    lists.add(JumpShowTextView(
//      text: 'adsfasdfsadf这是一段测试用的玩意玩意',
//      textSpan: _WidgetText(),
//    ));
//    lists.add(
//      SizedBox(
//        height: 40,
//      ),
//    );
//    lists.add(JumpShowTextView(
//      text: 'adsfasdfsadf这是一段测试用的玩意玩意',
//      textSpan: _WidgetText(),
//    ));
//    lists.add(
//      SizedBox(
//        height: 40,
//      ),
//    );
//    lists.add(JumpShowTextView(
//      text: 'adsfasdfsadf这是一段测试用的玩意玩意',
//      textSpan: _WidgetText(),
//    ));
//    lists.add(
//      SizedBox(
//        height: 40,
//      ),
//    );
//    lists.add(JumpShowTextView(
//      text: 'adsfasdfsadf这是一段测试用的玩意玩意',
//      textSpan: _WidgetText(),
//    ));
//    lists.add(
//      SizedBox(
//        height: 40,
//      ),
//    );
//    lists.add(JumpShowTextView(
//      text: 'adsfasdfsadf这是一段测试用的玩意玩意',
//      textSpan: _WidgetText(),
//    ));
//
//    return lists;
//  }

  _WidgetText() {
    return TextSpan(children: [
      TextSpan(
          text: 'adsfasdfsadf这是一段测试用的玩意玩意',
          style: TextStyle(color: Colors.black54, fontSize: 22)),
      TextSpan(
          text: '¥505050', style: TextStyle(color: Colors.red, fontSize: 28)),
      TextSpan(
          text: '哈哈哈哈哈哈',
          style: TextStyle(color: Colors.black54, fontSize: 22)),
    ]);
  }
}

_animationWidget(Animation animationa) {
  return FadeTransition(
    opacity: animationa,
    child: Container(
      alignment: Alignment(0, 0),
      height: 40,
      width: double.maxFinite,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'adsfasdfsadf这是一段测试用的玩意玩意',
              style: TextStyle(color: Colors.black54, fontSize: 12)),
          TextSpan(
              text: '¥505050',
              style: TextStyle(color: Colors.red, fontSize: 22)),
          TextSpan(
              text: '哈哈哈哈哈哈',
              style: TextStyle(color: Colors.black54, fontSize: 12)),
        ]),
      ),
    ),
  );
}

class BounceAnimation extends StatefulWidget {
  final double endNum;

  const BounceAnimation({Key key, this.endNum}) : super(key: key);

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double val;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation =
        Tween<double>(begin: 0.0, end: widget.endNum).animate(_controller)
          ..addListener(() {
            setState(() {
              val = _animation.value;
            });
          });
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      height: 40,
      width: double.maxFinite,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'adsfasdfsadf这是一段测试用的玩意玩意',
              style: TextStyle(color: Colors.black54, fontSize: 12)),
          TextSpan(
              text: ('${null == val ? 0.0 : val.toStringAsFixed(2)}'),
              style: TextStyle(color: Colors.red, fontSize: 22)),
          TextSpan(
              text: '哈哈哈哈哈哈',
              style: TextStyle(color: Colors.black54, fontSize: 12)),
        ]),
      ),
    );
  }
}

class FateWidget extends StatefulWidget {
  final int duration;

  const FateWidget({Key key, this.duration}) : super(key: key);

  @override
  _FateWidgetState createState() => _FateWidgetState();
}

class _FateWidgetState extends State<FateWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation animation;
  Duration _duration;

  @override
  void initState() {
    _duration = Duration(milliseconds: widget.duration);
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: _duration);
    animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    animation.addStatusListener((status) {});
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _animationWidget(animation);
  }

  _animationWidget(Animation animationa) {
    return FadeTransition(
      opacity: animationa,
      child: Container(
        alignment: Alignment(0, 0),
        height: 40,
        width: double.maxFinite,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'adsfasdfsadf这是一段测试用的玩意玩意',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
            TextSpan(
                text: '¥505050',
                style: TextStyle(color: Colors.red, fontSize: 22)),
            TextSpan(
                text: '哈哈哈哈哈哈',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
          ]),
        ),
      ),
    );
  }
}

class FateWidget2 extends StatefulWidget {
  final int duration;
  final int delay;

  const FateWidget2({Key key, this.duration, this.delay}) : super(key: key);

  @override
  _FateWidgetState2 createState() => _FateWidgetState2();
}

class _FateWidgetState2 extends State<FateWidget2>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation animation;
  Duration _duration;
  bool showWidget = false;

  @override
  void initState() {
    _duration = Duration(milliseconds: widget.duration ?? 1500);
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: _duration);
    animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    animation.addStatusListener((status) {});
    animation.addListener(() {
      print(animation.value);
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _animationWidget(animation);
  }

  _animationWidget(Animation animationa) {
    return FadeTransition(
      opacity: animationa,
      child: Container(
        alignment: Alignment(0, 0),
        height: 40,
        width: double.maxFinite,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'adsfasdfsadf这是一段测试用的玩意玩意',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
            TextSpan(
                text: '¥505050',
                style: TextStyle(color: Colors.red, fontSize: 22)),
            TextSpan(
                text: '哈哈哈哈哈哈',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
          ]),
        ),
      ),
    );
  }
}

///大概思路：String类型的[showText]和[hideText]
///关键是[IntTween]这个，它使得动画取值从[0~字长]
///也就是说10个字就是值从0到10得变化，那么这样一来思路就很清晰了
///[showText]用来显示文字，[hideText]存储要显示得文字
///[IntTween]产生得值可以当作下标，
///[widget.text.substring()]方法用来截取要显示得文字
///最后赋值给[showText]
class JumpShowTextView extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int milliseconds;
  final int delay;
  final TextSpan textSpan;

  const JumpShowTextView(
      {this.text,
      this.style: const TextStyle(color: Colors.black),
      this.milliseconds: 3000,
      this.delay: 0,
      this.textSpan});

  @override
  State<StatefulWidget> createState() {
    return _JumpShowTextView();
  }
}

class _JumpShowTextView extends State<JumpShowTextView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<int> animation;
  String showText = "";
  String hideText = "";

  @override
  initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliseconds));

    animation = IntTween(begin: 0, end: widget.text.length).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animation.addListener(() {
      //print('${animation.value}');
      setState(() {
        showText = widget.text.substring(0, animation.value);
        hideText = widget.text.substring(animation.value, widget.text.length);
      });
    });

    Future.delayed(Duration(milliseconds: widget.delay), () {
      animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      text: new TextSpan(children: <TextSpan>[
        //new TextSpan(text: showText, style: widget.style),
        widget.textSpan,
        new TextSpan(
          text: hideText,
          style: widget.style.copyWith(color: Colors.transparent),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
