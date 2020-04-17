import 'package:flutter/material.dart';

class BezierExample extends StatefulWidget {
  @override
  _BezierExampleState createState() => _BezierExampleState();
}

class _BezierExampleState extends State<BezierExample>
    with TickerProviderStateMixin {
  List<Tab> boids = [
    new Tab(
      text: '裁切控件',
      icon: Icon(Icons.backup),
    ),
    new Tab(
      text: '波浪',
      icon: Icon(Icons.ac_unit),
    ),
  ];
  List<Widget> tabView = [
    BezierClipContainer(),
    BezierClipContainer2(),
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: boids.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.deepOrange),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bezier实践出真理'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: boids,
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          children: tabView,
          controller: _tabController,
        ),
      ),
    );
  }
}

class BezierClipContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BezierClipper(),
            child: Container(
              height: 200,
              color: Colors.deepOrange,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            height: 150,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 1,
                    left: 0,
                    child: CustomPaint(
                      painter: CustomLinePainter(),
                    )),

                Positioned(
                    top: 1,
                    right: 0,
                    child: CustomPaint(
                      painter: CustomLinePainter2(),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLinePainter extends CustomPainter {
  Path path = Path();
  Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    path.lineTo(0, 20);
    path.lineTo(15, 20);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}class CustomLinePainter2 extends CustomPainter {
  Path path = Path();
  Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    path.lineTo(0, -20);
    path.lineTo(-15, -20);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 60);
    ///贝赛尔 需要一个控制点  一个尾点
    Offset firshCoin = Offset(size.width / 2, size.height);
    Offset endCoin = Offset(size.width, size.height - 60);
    path.quadraticBezierTo(firshCoin.dx, firshCoin.dy, endCoin.dx, endCoin.dy);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}

class BezierClipContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
