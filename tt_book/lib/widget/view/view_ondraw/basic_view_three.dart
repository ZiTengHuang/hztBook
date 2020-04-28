import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class BasicViewThree extends StatefulWidget {
  @override
  _BasicViewThreeState createState() => _BasicViewThreeState();
}

class _BasicViewThreeState extends State<BasicViewThree>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  AnimationController _animationController2;
  Animation<double> _animation2;

  AnimationController _animationController3;
  Animation<double> _animation3;
  double schedule = 0.0;
  double schedule2 = 0.0;
  double schedule3 = 0.0;
  double screentWidth;

  bool LineInitOK = false;
  bool showMa = false;
  var Image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load('assets/images/type_district.png').then((val) {
      showMa = true;
      Image = val;
      setState(() {});
    });
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation =
        Tween<double>(begin: 0, end: 0.6).animate(_animationController)
          ..addListener(() {
            setState(() {
              schedule = _animation.value;
            });
          });
    _animationController.forward();

    _animationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation2 =
        Tween<double>(begin: 0, end: 0.55).animate(_animationController2)
          ..addListener(() {
            setState(() {
              schedule2 = _animation2.value;
            });
          });
    _animationController2.forward();

    _animationController3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _animation3 =
        Tween<double>(begin: 0, end: 0.35).animate(_animationController3)
          ..addListener(() {
            setState(() {
              schedule3 = _animation3.value;
            });
          });
    _animationController3.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screentWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Center(
          child: _ProgrennsCircle(),
        ),
        Center(
          child: _ProgrennsLine(),
        ),
        Center(
          child: _ProgrennsCircle2(),
        ),
        Center(
          child: _ProgrennsLine2(),
        ),
      ],
    );
  }

  _ProgrennsCircle() {
    return Container(
      height: 150,
      width: 150,
      child: CustomPaint(
        child: Center(
          child: Text(schedule.toStringAsFixed(2)),
        ),
        size: Size(150, 150),
        painter: ProgressCirclePainter(schedule),
      ),
    );
  }

  _ProgrennsCircle2() {
    return Container(
      height: 200,
      width: 200,
      child: CustomPaint(
        child: Center(
          child: Text(schedule.toStringAsFixed(2)),
        ),
        size: Size(200, 200),
        painter: ProgressCirclePainter2(schedule, schedule2, schedule3),
      ),
    );
  }

  _ProgrennsLine() {
    return Container(
      height: 150,
      width: double.infinity,
      child: CustomPaint(
        child: Center(
          child: Text(schedule.toStringAsFixed(2)),
        ),
        size: Size(150, screentWidth),
        painter: ProgressLinePainter(schedule),
      ),
    );
  }

  _ProgrennsLine2() {
    return Container(
      height: 150,
      width: 350,
      child: Visibility(
        visible: showMa,
        child: CustomPaint(
          child: Center(
            child: Text(schedule.toStringAsFixed(2)),
          ),
          size: Size(150, screentWidth),
          painter: ProgressLine2Painter(schedule, Image),
        ),
      ),
    );
  }
}

num deg2Rad(num deg) => deg * (pi / 180.0);

class ProgressCirclePainter extends CustomPainter {
  double schedule;

  ProgressCirclePainter(double schedule) {
    this.schedule = schedule;
  }

//角度转弧度
  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    //secondProgress 值转化为度数
    final double angle = 360.0 * schedule;
    //角度转化为弧度
    final double sweepAngle = deg2Rad(angle);

    var back90 = deg2Rad(-90.0); //往前推90度 从12点钟方向开始

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        back90,
//        schedule * (pi * 2),
        sweepAngle,
        false,
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class ProgressCirclePainter2 extends CustomPainter {
  double schedule;
  double schedule2;
  double schedule3;

  ProgressCirclePainter2(double schedule, double schedule2, double schedule3) {
    this.schedule = schedule;
    this.schedule2 = schedule2;
    this.schedule3 = schedule3;
  }

//角度转弧度
  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeWidth = 15
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    ///起始角度 -200度
    var startArc = deg2Rad(-215);

    //secondProgress 值转化为度数 总角度为250度  角度转化为弧度
    final double sweepAngle = deg2Rad((250.0 * schedule));

    //secondProgress 值转化为度数 总角度为250度  角度转化为弧度
    final double sweepAngle2 = deg2Rad((250.0 * schedule2));

    //secondProgress 值转化为度数 总角度为250度  角度转化为弧度
    final double sweepAngle3 = deg2Rad((250.0 * schedule3));

    ///底边
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startArc,
        deg2Rad((250.0 * 1)),
        false,
        _paint..color = Colors.grey);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startArc,
        sweepAngle,
        false,
        _paint..color = Colors.red);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startArc,
        sweepAngle2,
        false,
        _paint..color = Colors.yellow);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startArc,
        sweepAngle3,
        false,
        _paint..color = Colors.blue);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class ProgressLinePainter extends CustomPainter {
  double schedule;

  ProgressLinePainter(double schedule) {
    this.schedule = schedule;
  }

  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    canvas.drawLine(Offset(0, size.height / 2),
        Offset(schedule * size.width, size.height / 2), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class ProgressLine2Painter extends CustomPainter {
  double schedule;
  var image;

  ProgressLine2Painter(double schedule, image) {
    this.schedule = schedule;
    this.image = image;
    Future.delayed(new Duration(milliseconds: 100), () {});
  }

  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  // 初始化, 各种资源
//  Future<VoidCallback> init() async {
////    Size size = MediaQueryData.fromWindow(ui.window).size;
////    print(size);
//    image =await load('');
//
//    return null;
//  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
//    print('我的天');
//    print(size.height);
//    print(size.width);
//    print(image);
    canvas.drawLine(Offset(20, size.height / 2),
        Offset(size.width-20, size.height / 2), _paint..color = Colors.grey ..strokeWidth = schedule == 0 ? 15 :15);
    canvas.drawLine(
        Offset(20, size.height / 2),
        Offset(schedule * (size.width)<20 ? 20 :schedule * (size.width-20), size.height / 2),
        _paint..color = Colors.deepPurple ..strokeWidth = schedule == 0 ? 0 :15);
    canvas.drawImage(image, Offset(schedule * (size.width -40), 25), _paint);
//    canvas.drawImageRect(image, Rect.fromLTRB(30, 30, 60, 60),
//        Rect.fromLTRB(30, 30, 60, 60), _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

Future<ui.Image> load(String asset) async {
  ByteData data = await rootBundle.load(asset);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  ui.FrameInfo fi = await codec.getNextFrame();
  return fi.image;
}
