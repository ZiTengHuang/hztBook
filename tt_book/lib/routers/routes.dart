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
  static String SteperBarWidget3 = '/SteperBarWidget3';
  static String BottomNavBar = '/BottomNavBar';
  static String FrostedGlassDemo = '/FrostedGlassDemo';
  static String SearchShow = '/SearchShow';
  static String LittleAnimation = '/LittleAnimation';
  static String DartBasic = '/DartBasic';
  static String TikTokHomePage = '/TikTokHomePage';
  static String FangyePage = '/FangyePage';
  static String FavAnimation = '/FavAnimation';
  static String ListListenerOpactiv = '/ListListenerOpactiv';
  static String BasicGrid = '/BasicGrid';
  static String BezierViewBasic = '/BezierViewBasic';
  static String BezierExample = '/BezierExample';
  static String OnBoardings = '/OnBoardings';
  static String ScanWidget = '/ScanWidget';
  static String BasicViewOnDraw = '/BasicViewOnDraw';



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
    router.define(SteperBarWidget3, handler:SteperBarWidget3Handerl,transitionType: TransitionType.native);
    router.define(BottomNavBar, handler:BottomNavBarHanderl,transitionType: TransitionType.native);
    router.define(FrostedGlassDemo, handler:FrostedGlassDemoHanderl,transitionType: TransitionType.native);
    router.define(SearchShow, handler:SearchShowHanderl,transitionType: TransitionType.native);
    router.define(LittleAnimation, handler:LittleAnimationHanderl,transitionType: TransitionType.native);
    router.define(TikTokHomePage, handler:TikTokHomePageHanderl,transitionType: TransitionType.native);
    router.define(DartBasic, handler:DartBasicHanderl,transitionType: TransitionType.native);
    router.define(FangyePage, handler:FangyePageHanderl,transitionType: TransitionType.native);
    router.define(FavAnimation, handler:FavAnimationHanderl,transitionType: TransitionType.native);
    router.define(ListListenerOpactiv, handler:ListListenerOpactivHanderl,transitionType: TransitionType.native);
    router.define(BasicGrid, handler:BasicGridHanderl,transitionType: TransitionType.native);
    router.define(BezierViewBasic, handler:BezierViewBasicHanderl,transitionType: TransitionType.native);
    router.define(BezierExample, handler:BezierExampleHanderl,transitionType: TransitionType.native);
    router.define(OnBoardings, handler:OnBoardingsHanderl,transitionType: TransitionType.native);
    router.define(ScanWidget, handler:ScanWidgetHanderl,transitionType: TransitionType.native);
    router.define(BasicViewOnDraw, handler:BasicViewOnDrawHanderl,transitionType: TransitionType.native);
  }
}