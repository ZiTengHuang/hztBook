import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:tt_book/routers/router_handler.dart';

class Routes{

  static String OnBoardingPage = '/OnBoardingPage';
  static String FruitheroPage = '/FruitheroPage';
  static String MeasurePage = '/MeasurePage';
  static String HeroPage = '/HeroPage';
  static String CustomPaintDemo = '/CustomPaintDemo';
  static String Lottie = '/Lottie';



  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('ERROR====>ROUTE WAS NOT FONUND!!!');
        });

    router.define(OnBoardingPage, handler: OnBoardingHanderl,transitionType: TransitionType.native);
    router.define(FruitheroPage, handler: FruitheroPageHanderl,transitionType: TransitionType.native);
    router.define(MeasurePage, handler: MeasurePageHanderl,transitionType: TransitionType.native);
    router.define(HeroPage, handler: HeroPageHanderl,transitionType: TransitionType.native);
    router.define(CustomPaintDemo, handler: CustomPaintDemoHanderl,transitionType: TransitionType.native);
    router.define(Lottie, handler:LottieHanderl,transitionType: TransitionType.native);
  }
}