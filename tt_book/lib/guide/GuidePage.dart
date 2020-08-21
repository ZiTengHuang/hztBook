import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/models/post.dart';
import 'package:tt_book/reconsitution/routers/fluro_navigator.dart';

enum GuideType {
  GUIDE,
  SPLASH,
}

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int currentIndex = 0;
  GuideType _guideType = GuideType.GUIDE;
  int _count = 10;
  int _timerOut= 10;
  TimerUtil _timerUtil;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_guideType == GuideType.SPLASH) {
      _doCountDown();
    }
  }

  initSplashData() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    clearTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _guideType == GuideType.GUIDE
          ? Column(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (_, index) {
                          return Container(
                            child: Image.asset(
                              'assets/images/guide$index.png',
                              fit: BoxFit.fill,
                            ),
                          );
                        })),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3, (index) => _buildDot(index: index)),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        FlatButton(
                            onPressed: () {
                              _guideType = GuideType.SPLASH;
                              _doCountDown();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 190,
                              child: Text(
                                '直接进入',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            )),
                        Spacer(),
                      ],
                    ))
              ],
            )
          : Stack(
              children: <Widget>[
                _buildAdWidget(),
                Positioned(
                  child: _buildTimerButton(),
                  bottom: 40,
                  right: 50,
                ),
              ],
            ),
    );
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      'assets/images/guide1.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _buildAdWidget() {
//    if (_splashModel == null) {
//      return new Container(
//        height: 0.0,
//      );
//    }
    return new InkWell(
      onTap: () {
//          if (ObjectUtil.isEmpty(_splashModel.url)) return;
//          _goMain();
//          NavigatorUtil.pushWeb(context,
//              title: _splashModel.title, url: _splashModel.url);
          NavigatorUtils.goHome(context);

      },
      child: new Container(
        alignment: Alignment.center,
        child: CachedNetworkImage(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          imageUrl: 'https://upload-images.jianshu.io/upload_images/1438821-9ca624df6555ebd1.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }

//  CachedNetworkImage(
//  width: double.infinity,
//  height: double.infinity,
//  fit: BoxFit.fill,
//  imageUrl: posts[1].imageUrl,
//  errorWidget: (_, ___, __) => _buildSplashBg(),
//  )

  _buildTimerButton() {
    return GestureDetector(
      onTap: () {
        NavigatorUtils.goHome(context);
      },
      child: Container(
        alignment: Alignment(0, 0),
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Color(0x80ffffff),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          '倒计时:$_count',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  void _doCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: _timerOut * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        NavigatorUtils.goHome(context);
      }
    });
    _timerUtil.startCountDown();
  }

  void clearTimer() {
    if (_timerUtil != null) {
      _timerUtil.cancel();
    }
  }

  AnimatedContainer _buildDot({int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: kThemeAnimationDuration,
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color:
            currentIndex == index ? Colors.deepOrangeAccent : Colors.lightGreen,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
