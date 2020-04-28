import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class BasicViewOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screentWidth = MediaQuery.of(context).size.width;
    double screentHight = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.black26,
          child: CustomPaint(
            painter: BasicViewOnePainter(),
          ),
        )
      ],
    );
  }
}

class BasicViewOnePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.deepOrange
    ..strokeWidth = 4
    ..isAntiAlias = true;

  Offset pointsOffset1 = Offset(40, 40);
  Offset pointsOffset2 = Offset(40, 65);
  Offset pointsOffset3 = Offset(40, 90);

  Offset pointsOffset4 = Offset(65, 40);
  Offset pointsOffset5 = Offset(65, 65);
  Offset pointsOffset6 = Offset(65, 90);

  Offset LineOffsetBegin = Offset(40, 200);
  Offset LineOffsetEnd = Offset(140, 200);

  Offset LineOffsetBegin2 = Offset(90, 200);
  Offset LineOffsetEnd2 = Offset(90, 320);

  Offset LineOffsetBegin3 = Offset(40, 320);
  Offset LineOffsetEnd3 = Offset(140, 320);

  Offset LineOffsetBegin4 = Offset(160, 200);
  Offset LineOffsetEnd4 = Offset(280, 200);

  Offset LineOffsetBegin5 = Offset(160, 200);
  Offset LineOffsetEnd5 = Offset(160, 320);

  Offset LineOffsetBegin6 = Offset(160, 320);
  Offset LineOffsetEnd6 = Offset(280, 320);

  Offset LineOffsetBegin7 = Offset(280, 200);
  Offset LineOffsetEnd7 = Offset(280, 320);

  Paint _paintLine = new Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.blueAccent
    ..strokeWidth = 13;

  Paint _arcPaint = new Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.green
    ..strokeWidth = 2;

  double progress = 1;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Offset _circleOffset = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(_circleOffset, 50, _paint);
    canvas.drawColor(Color(0x70000000), BlendMode.colorBurn);
    canvas.drawPoints(
        PointMode.points,
        [pointsOffset1, pointsOffset2, pointsOffset3],
        _paint
          ..strokeWidth = 20
          ..strokeCap = StrokeCap.butt);

    canvas.drawPoints(
        PointMode.points,
        [pointsOffset4, pointsOffset5, pointsOffset6],
        _paint
          ..strokeWidth = 20
          ..strokeCap = StrokeCap.round);

    canvas.drawOval(Rect.fromLTRB(40, 100, 140, 180), _paint);
    canvas.drawLine(LineOffsetBegin, LineOffsetEnd, _paintLine);
    canvas.drawLine(LineOffsetBegin2, LineOffsetEnd2, _paintLine);
    canvas.drawLine(LineOffsetBegin3, LineOffsetEnd3, _paintLine);
    canvas.drawLine(LineOffsetBegin4, LineOffsetEnd4, _paintLine);
    canvas.drawLine(LineOffsetBegin5, LineOffsetEnd5, _paintLine);
    canvas.drawLine(LineOffsetBegin6, LineOffsetEnd6, _paintLine);
    canvas.drawLine(LineOffsetBegin7, LineOffsetEnd7, _paintLine);

    canvas.drawRect(
        Rect.fromLTRB(40, 340, 180, 440),
        _paint
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);

    canvas.drawArc(Rect.fromLTRB(40, 460, 190, 610), 0.0, 0.2, true,
        _arcPaint..style = PaintingStyle.stroke);
    canvas.drawArc(Rect.fromLTRB(40, 460, 190, 610), 0.3, 0.5, true,
        _arcPaint..color = Colors.deepPurple);
    canvas.drawArc(Rect.fromLTRB(40, 460, 190, 610), 0.6, 0.9, true,
        _arcPaint..color = Colors.red);
    canvas.drawArc(
        Rect.fromLTRB(40, 460, 190, 610),
        pi / 2,
        -progress * (pi * 2),
        true,
        _arcPaint
          ..color = Colors.red
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
