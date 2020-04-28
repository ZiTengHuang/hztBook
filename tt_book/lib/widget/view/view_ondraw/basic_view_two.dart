import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
class BasicViewTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: ClipExample(),
      ),
    );
  }
}

class ClipExample extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  Path pathCricle = new Path()..addOval(Rect.fromLTRB(50, 50, 200, 200));
  Path pathCricle2 = new Path()..addOval(Rect.fromLTRB(150, 50, 300, 200));
  Path pathCricle3 = new Path()
    ..lineTo(100, 350) //因为不是4个点  所以从0。0 开始画到这个坐标
    ..relativeLineTo(100, 0) //在他绘制完成的终点在衍生一条线
    ..relativeLineTo(0, -100);

  Path pathMoveLine = new Path()
    ..lineTo(140, 100)
    ..moveTo(200, 350) //移动到一个点 ，然后用这个点作为起始点
    ..lineTo(300, 350);

  Path pathArc = new Path()
    ..lineTo(150, 100)
    ..addArc(Rect.fromLTRB(150, 200, 250, 300), -90, 90);
  Path pathSJ = Path()
    ..moveTo(30, 400)
    ..lineTo(130, 400)
    ..lineTo(80, 450)
    ..close();

  ///close() 和 lineTo(起点坐标) 是完全等价的。

  Offset circleOffset = Offset(100, 600);
  Offset circleOffset2 = Offset(200, 600);

  var image2;
  ui.Paragraph  pg;
  ClipExample() {
    load('assets/images/wufu/lu.png').then((val) {
      image2 = val;
    });


    ui.ParagraphBuilder pb = new ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.left,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 24,
    ))
      ..pushStyle(ui.TextStyle(color: Colors.black87))
      ..addText('我日哦');
    //绘制的宽度
    pg = pb.build()..layout(new ui.ParagraphConstraints(width: 120));
  }


  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(pathCricle, _paint);
    canvas.drawPath(
      pathCricle2,
      _paint
        ..color = Colors.green
        ..style = PaintingStyle.fill
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPath(pathCricle3, _paint..style = PaintingStyle.stroke);
    canvas.drawPath(pathMoveLine, _paint..style = PaintingStyle.stroke);
    canvas.drawPath(
        pathArc,
        _paint
          ..style = PaintingStyle.stroke
          ..color = Colors.yellowAccent);
    canvas.drawPath(
        pathSJ,
        _paint
          ..color = Colors.black87
          ..style = PaintingStyle.fill
          ..colorFilter = ColorFilter.linearToSrgbGamma());
    canvas.drawCircle(
        circleOffset,
        80,
        _paint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3);
    canvas.drawCircle(circleOffset2, 80, _paint);
    canvas.drawImage(image2, Offset(150, 600), _paint..color = Colors.black87);
    canvas.drawParagraph(pg, Offset(150, 400));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}

Future<ui.Image> load(String asset) async {
  ByteData data = await rootBundle.load(asset);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  ui.FrameInfo fi = await codec.getNextFrame();
  return fi.image;
}
