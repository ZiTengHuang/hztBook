import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPaintDemo extends StatefulWidget {
  @override
  _CustomPaintDemoState createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomPaint(
          size: Size(350, 350),
          painter: MyPainter(),
        ),
      ),
    );
  }
}
//http://m h.aa e 3点com

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    print('${size.width} ::::: ${size.height}');
    double eWidht = size.width / 15;
    double eHeigth = size.height / 15;

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);

    canvas.drawRect(Offset.zero & size, paint);

    paint = Paint()
      ..isAntiAlias = false
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1;
    for (int i = 0; i <= 15; ++i) {
      double dy = eHeigth * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dy = eWidht * i;
      canvas.drawLine(Offset(dy, 0), Offset(dy, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
