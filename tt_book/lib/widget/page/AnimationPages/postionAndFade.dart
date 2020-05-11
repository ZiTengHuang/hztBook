import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MixtureAnimation extends StatefulWidget {
  @override
  _MixtureAnimationState createState() => _MixtureAnimationState();
}

class _MixtureAnimationState extends State<MixtureAnimation>
    with TickerProviderStateMixin {
  double postionRed = 0;
  double view1;
  double view2;
  double viewTop = 0;
  double postionView2 = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double centerWidth = width / 2;

    view1 = height * 0.1;
    view2 = height * 0.5;
    postionRed = height / 2 - 170;
    postionView2 = height / 2 - 330;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('混入动画'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.build), onPressed: () {})
        ],
      ),
      body: View1(
        width: width,
        view1: view1,
        view2: view2,
        postionRed: postionRed,
      ),
    );
  }
}


class View1 extends StatefulWidget {
  final double width;
  final double view1;

  final double view2;

  final double postionRed;
  final double postionView2;

  const View1(
      {Key key,
      this.view1,
      this.view2,
      this.postionRed,
      this.width,
      this.postionView2})
      : super(key: key);

  @override
  _View1State createState() => _View1State();
}

class _View1State extends State<View1> with TickerProviderStateMixin {
  AnimationController _PostionAnimationController;
  Animation<double> _PostionAnimation;
  AnimationController _PostionAnimationController2;
  Animation<double> _PostionAnimation2;



    AnimationController _PostionAnimationController77;
  Animation<double> _PostionAnimation77;
  AnimationController _PostionAnimationController88;
  Animation<double> _PostionAnimation88;





  AnimationController _PostionAnimationController3;
  Animation<double> _PostionAnimation3;

  AnimationController _OpativAnimationController;
  Animation<double> _OpativAnimation;


  AnimationController _OpativAnimationController2;
  Animation<double> _OpativAnimation2;


  AnimationController _OpativAnimationController3;
  Animation<double> _OpativAnimation3;


  bool stepOne = true;
  double _opacity = 0;
  bool isfalse = true;

  double animationPosition ;
  double animationPosition2  ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('中心点${widget.postionRed}');
    print('view1点${widget.view1}');
    print('view2点${widget.view2}');

    animationPosition = widget.view1;
    animationPosition2=widget.view2;
    _PostionAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _PostionAnimation =
        Tween<double>(begin: widget.view1, end: widget.postionRed)
            .animate(_PostionAnimationController)
              ..addListener(() {
                setState(() {
                  animationPosition = _PostionAnimation.value;
                });
//                print(_PostionAnimation.value);
              });

    _PostionAnimationController2 =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _PostionAnimation2 =
        Tween<double>(begin: widget.view2, end: widget.postionRed)
            .animate(_PostionAnimationController2)
              ..addListener(() {
                setState(() {
                  animationPosition2 = _PostionAnimation2.value;



                });
//                print(_PostionAnimation.value2);
              });

        _PostionAnimationController77 =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _PostionAnimation77 =
        Tween<double>(begin: widget.postionRed , end:widget.view1)
            .animate(_PostionAnimationController77)
              ..addListener(() {
                setState(() {
                  animationPosition = _PostionAnimation77.value;

                });
//                print(_PostionAnimation.value);
              });

    _PostionAnimationController88 =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _PostionAnimation88 =
        Tween<double>(begin: widget.postionRed , end: widget.view2)
            .animate(_PostionAnimationController88)
              ..addListener(() {
                setState(() {
                  animationPosition2 = _PostionAnimation88.value;
                });
//                print(_PostionAnimation.value2);
              });







    _PostionAnimationController3 =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _PostionAnimation3 =
        Tween<double>(begin: widget.postionRed, end: widget.postionRed - 115)
            .animate(_PostionAnimationController3)
              ..addListener(() {
                setState(() {});
//                print(_PostionAnimation.value2);
              });

    _OpativAnimationController =
        new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _OpativAnimation =
        Tween<double>(begin: 1, end: 0).animate(_OpativAnimationController)
          ..addListener(() {
            setState(() {
              _opacity = _OpativAnimation.value;
            });
//                print(_PostionAnimation.value2);
          });

    _OpativAnimationController2 =
        new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _OpativAnimation2 =
        Tween<double>(begin: 0, end: 1).animate(_OpativAnimationController2)
          ..addListener(() {
            setState(() {});
//                print(_PostionAnimation.value2);
          });


    _OpativAnimationController3 =
        new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _OpativAnimation3 =
        Tween<double>(begin: 0, end: 1).animate(_OpativAnimationController3)
          ..addListener(() {
            setState(() {
              _opacity = _OpativAnimation3.value;
            });

           });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
              child: Text('按钮'),
              onPressed: () {
                _PostionAnimationController.forward(from: 0);
                _PostionAnimationController2.forward(from: 0).then((_) {
                  _OpativAnimationController3.forward(from: 0).then((_){
                    setState(() {
                      stepOne = false;
                    });
                    _PostionAnimationController3.forward(from: 0);

                  });

                });
              }),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: RaisedButton(
              child: Text('按钮2'),
              onPressed: () {
                _PostionAnimationController.forward(from: 0);
                _PostionAnimationController2.forward(from: 0).then((_){
                    _PostionAnimationController77.forward(from: 0);
                    _PostionAnimationController88.forward(from: 0);
                });

              }),
        ),
        Visibility(
          visible: stepOne,
          child: Positioned(
            top: animationPosition,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/fack_bg.png'),fit: BoxFit.fill)
              ),
              height: 170,
              width: widget.width,
            ),
          ),
        ),

        Positioned(
          top: _PostionAnimation3.value,
          left: 0,
          child: Opacity(
            opacity: _OpativAnimation2.value,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/fack_bg.png'),fit: BoxFit.fill)
              ),
              height: 400,
              width: widget.width,
              child: Text('最终结果'),
            ),
          ),
        ),
        Visibility(
          visible: stepOne,
          child: Positioned(
            top: animationPosition2,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/fack_bg.png'),fit: BoxFit.fill)
              ),
              height: 170,
              width: widget.width,
            ),
          ),
        ),
        Positioned(
          top: _PostionAnimation3.value,
          left: 0,
          child: Opacity(
            opacity:_opacity,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: stepOne ? 170 : 400,
              width: widget.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/faguang.png'),
                    fit: BoxFit.fill),
              ),
              onEnd: () {
                _OpativAnimationController.forward(from: 0);
                _OpativAnimationController2.forward(from: 0);
              },
            ),
          ),
        ),
      ],
    );
  }
}
