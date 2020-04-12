import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


///模仿斗音红心点赞效果
class FavAnimation extends StatefulWidget {
  final Color startColor;
  final Color endColor;
  final double size;
  final VoidCallback voidCallback;

  const FavAnimation(
      {Key key, this.startColor, this.endColor, this.size, this.voidCallback})
      : super(key: key);

  @override
  _FavAnimationState createState() => _FavAnimationState();
}

class _FavAnimationState extends State<FavAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController1;
  AnimationController _animationController2;
  AnimationController _animationController3;
  AnimationController _animationController4;
  AnimationController _animationController5;
  Animation _animation1;
  Animation _animation2;
  Animation _animation3;
  Animation _animation4;
  Animation _animation5;
  Animation<double> _currentAnimation;
  bool isClick = false;
  bool isShow = true;
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController1 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _animationController2 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 100));
    _animationController3 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 100));

    _animationController4 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _animationController5 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 100));

    _animation1 = Tween(begin: 1.0, end: 0.1).animate(_animationController1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((start) {
        if (start == AnimationStatus.completed) {
          _animationController2.forward();
          _animation2 =
              Tween(begin: 0.1, end: 1.2).animate(_animationController2)
                ..addListener(() {
                  _currentAnimation = _animation2;
                  setState(() {});
                })
                ..addStatusListener((start) {
                  if (start == AnimationStatus.completed) {
                    _animationController3.forward();
                    _animation3 = Tween(begin: 1.2, end: 1.0)
                        .animate(_animationController3)
                          ..addListener(() {
                            _currentAnimation = _animation3;
                            setState(() {});
                          });
                  }
                });
        }
      });

    _animation4 = Tween(begin: 1.0, end: 0.8).animate(_animationController4)
      ..addListener(() {
        setState(() {});
        _currentAnimation = _animation4;
      })
      ..addStatusListener((start) {
        if (start == AnimationStatus.completed) {
          _animationController5.forward();
          _animation5 = Tween(begin: 0.8, end: 1.0)
              .animate(_animationController5)
                ..addListener(() {
                  setState(() {

                  });
                  _currentAnimation = _animation5;
                });
        }
      });

    _currentAnimation = _animation1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            isClick = !isClick;
             count ++;
            isShow?  isClick ?  _animationController1.forward():_animationController4.forward():
            isClick ?  _animationController1.reset():_animationController4.reset();
            if(count ==2){
                isShow = false;
            }
          },
          child: Icon(
            Icons.favorite,
            size: 22 * _currentAnimation.value,
            color: isClick ? Colors.red : Colors.black12,
          ),
        ),
      ),
    );
  }
}
