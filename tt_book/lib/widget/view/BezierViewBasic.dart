import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BezierViewBasic extends StatefulWidget {
  @override
  _BezierViewBasicState createState() => _BezierViewBasicState();
}

class _BezierViewBasicState extends State<BezierViewBasic> {
  @override
  void initState() {
    // TODO: implement initState
    //横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //全屏显示
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BezierPainter(),
    );
  }
}

class BezierPainter extends CustomPainter {
  Paint _gridPaint;
  Path _gridPath;
  Paint _mainPaint;
  Path _mainPaht;
  Paint _helpPaint;
  Offset p0 = Offset(0, 0);
  Offset p1 = Offset(100, 100);
  Offset p2 = Offset(120, -60);


  BezierPainter() {
    _gridPaint = Paint()..style = PaintingStyle.stroke;
    _gridPath = Path();

    _mainPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange
      ..strokeWidth = 2;
    _mainPaht = new Path();
    _helpPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blueAccent
       ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.color);
    canvas.translate(size.width / 2, size.height / 2);
    _drawGrid(canvas, size); //绘制格线
    _drawAxis(canvas, size); //绘制轴线
    drawBezier(canvas);
    drawHelpLine(canvas);
  }

  drawBezier(Canvas canvas) {
      _mainPaht.moveTo(p0.dx, p0.dy);
      _mainPaht.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
      canvas.drawPath(_mainPaht, _mainPaint);
  }
  drawHelpLine(Canvas canvas){
        canvas.drawPoints(PointMode.points, [p0,p1,p2], _helpPaint..strokeWidth=8);
        canvas.drawPoints(PointMode.lines, [p0,p1,p1,p2],_helpPaint..strokeWidth =2);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void _drawGrid(Canvas canvas, Size size) {
    _gridPaint
      ..color = Colors.grey
      ..strokeWidth = 0.5;
    _gridPath = _buildGridPath(_gridPath, size);
    canvas.drawPath(_buildGridPath(_gridPath, size), _gridPaint);

    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1); //沿y轴镜像
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1); //沿原点镜像
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();
  }

  void _drawAxis(Canvas canvas, Size size) {
    canvas.drawPoints(
        PointMode.lines,
        [
          Offset(-size.width / 2, 0),
          Offset(size.width / 2, 0),
          Offset(0, -size.height / 2),
          Offset(0, size.height / 2),
          Offset(0, size.height / 2),
          Offset(0 - 7.0, size.height / 2 - 10),
          Offset(0, size.height / 2),
          Offset(0 + 7.0, size.height / 2 - 10),
          Offset(size.width / 2, 0),
          Offset(size.width / 2 - 10, 7),
          Offset(size.width / 2, 0),
          Offset(size.width / 2 - 10, -7),
        ],
        _gridPaint
          ..color = Colors.blue
          ..strokeWidth = 1.5);
  }

  Path _buildGridPath(Path path, Size size, {step = 20.0}) {
    for (int i = 0; i < size.height / 2 / step; i++) {
      path.moveTo(0, step * i);
      path.relativeLineTo(size.width / 2, 0);
    }
    for (int i = 0; i < size.width / 2 / step; i++) {
      path.moveTo(step * i, 0);
      path.relativeLineTo(
        0,
        size.height / 2,
      );
    }
    return path;
  }
}
