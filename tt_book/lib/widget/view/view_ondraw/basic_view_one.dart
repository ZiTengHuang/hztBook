import 'dart:ui';

import 'package:flutter/material.dart';

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



  Paint _paintLine = new Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.blueAccent
    ..strokeWidth = 13;

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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
