import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/widget/provide/indexNotifier.dart';
import 'package:tt_book/widget/provide/offsetNotifier.dart';
import 'package:tt_book/widget/widgets/PageIndicator.dart';

import 'GreatWave.dart';
import 'Reject.dart';
import 'Samurai.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  PageController _pageController;
  int currentIndex = 0;
  bool lastPage = false;

  AnimationController _animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();

    ///会把状态栏都隐藏
    SystemChrome.setEnabledSystemUIOverlays([]);
    _animationController = AnimationController(
        duration: new Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(
      begin: 0.6,
      end: 1.0
    ).animate(_animationController);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => OffsetNotifier(_pageController),
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 36, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hops",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.shopping_basket), onPressed: () {}),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    Provider.of<IndexNotifier>(context).index = index;
                    setState(() {
                      currentIndex = index;
                      if(index ==2){
                         lastPage =true;
                         _animationController.forward();
                      }else{
                         lastPage = false;
                         _animationController.reverse();
                      }

                    });
                  },
                  children: <Widget>[
                    Samurai(),
                    Reject(),
                    GreatWave(),
                  ],
                ),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 50,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PageIndicator(),
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: lastPage ? FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          onPressed: () {
                          },
                        ):SizedBox(

                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

    );
  }
}
