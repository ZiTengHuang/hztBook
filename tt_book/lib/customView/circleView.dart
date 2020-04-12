import 'package:flutter/material.dart';
import 'dart:math';

class CircleView extends StatefulWidget {
  @override
  _CircleViewState createState() => _CircleViewState();
}

class _CircleViewState extends State<CircleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomPaint(
            size: Size(150, 150),
            painter: CircleViewRealize(),
          )
        ],
      ),
    );
  }
}

class CircleViewRealize extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}

class GradientCircleProgressIndicator extends StatelessWidget {
  // 粗细
  final double strokeWidth;

  //半径
  final double radius;

  //两端是否圆角
  final bool strokeCapRound;

  //当前进度，取值范围【0-1】
  final double value;

  //进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  ///渐变颜色组
  final List<Color> colors;

  ///渐变色终止点  对应colors
  final List<double> stops;

  const GradientCircleProgressIndicator(
      {Key key,
        this.strokeWidth = 2.0,
        @required this.radius,
        @required this.colors,
        this.stops,
        this.strokeCapRound = false,
        this.backgroundColor = const Color(0xFFEEEEEE),
        this.totalAngle = 2 * pi,
        this.value
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _offset = .0;

    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircleProgressIndicatorPainter(
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: _colors,

        ),
      ),
    );
  }
}

class _GradientCircleProgressIndicatorPainter extends CustomPainter{

  _GradientCircleProgressIndicatorPainter({
    this.strokeWidth: 10.0,
    this.strokeCapRound: false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.radius,
    this.total = 2 * pi,
    @required this.colors,
    this.stops,
    this.value
  });

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    if(radius != null){
      /// fromRadius 根据radius 创建一个正方形
        size = Size.fromRadius(radius);
    }
    double _offset =  strokeWidth / 2.0 ;
    double _value  = (value ?? .0);
    /// clamp 只允许一个上界，和下届的值
    _value  = _value.clamp(.0, 1.0) * total;
    /// 起始坐标
    double _start = .0;



  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
