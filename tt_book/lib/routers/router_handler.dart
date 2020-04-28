import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/dart/basic_bool_list.dart';
import 'package:tt_book/widget/animationsWidget/FavAnimation.dart';
import 'package:tt_book/provider/gridData_provider.dart';
import 'package:tt_book/widget/basic/frosted_glass_demo.dart';
import 'package:tt_book/widget/onboarding/onboardings.dart';
import 'package:tt_book/widget/page/AnimationPages/Lottie.dart';
import 'package:tt_book/widget/page/AnimationPages/fangye_page.dart';
import 'package:tt_book/widget/page/AnimationPages/hero.dart';
import 'package:tt_book/widget/page/AnimationPages/postionAndFade.dart';
import 'package:tt_book/widget/page/MeasurePage.dart';
import 'package:tt_book/widget/page/fruitheros/fruithero_page.dart';
import 'package:tt_book/widget/page/grid/basic_grid.dart';
import 'package:tt_book/widget/page/launchePage/Onboarding.dart';
import 'package:tt_book/widget/page/oneCode/BottomNavBar.dart';
import 'package:tt_book/widget/provide/indexNotifier.dart';
import 'package:tt_book/widget/scan/scan_widget.dart';
import 'package:tt_book/widget/scroller/listListenerOpactiv.dart';

import 'package:tt_book/widget/search/search_show.dart';
import 'package:tt_book/widget/tiktok/tiktok_home_page.dart';
import 'package:tt_book/widget/view/CustomPaintDemo.dart';
import 'package:tt_book/widget/view/littleAnimation.dart';
import 'package:tt_book/widget/view/steper_bar_widget3.dart';
import 'package:tt_book/widget/view/view_ondraw/BasicViewOnDraw.dart';
import 'package:tt_book/widget/page/sliver/SliverPageDetails.dart';
import '../widget/view/BezierViewBasic.dart';
import '../widget/view/BezierExample.dart';

/// 跳转抽奖界面
Handler OnBoardingHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChangeNotifierProvider<IndexNotifier>(
      create: (_) => IndexNotifier(), child: OnBoarding());
});

/// 水果界面
Handler FruitheroPageHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FruitheroPage();
});

/// 水果界面
Handler MeasurePageHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MeasurePage();
});

/// hero动画界面
Handler HeroPageHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HeroPage();
});

/// 棋盘界面
Handler CustomPaintDemoHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CustomPaintDemo();
});

/// lottie界面
Handler LottieHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Lottie();
});

/// lottie界面
Handler SteperBarWidget3Handerl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SteperBarWidget3();
});

/// BottomNavBarHanderl
Handler BottomNavBarHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BottomNavBar();
});

///
Handler FrostedGlassDemoHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FrostedGlassDemo();
});

///
Handler SearchShowHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchShow();
});

Handler LittleAnimationHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LittleAnimation();
});
Handler TikTokHomePageHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TikTokHomePage();
});

Handler DartBasicHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DartBasic();
});

Handler FangyePageHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FangyePage();
});
Handler FavAnimationHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FavAnimation();
});

Handler ListListenerOpactivHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ListListenerOpactiv();
});

Handler BezierViewBasicHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BezierViewBasic();
});

Handler BezierExampleHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BezierExample();
});
Handler OnBoardingsHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OnBoardings();
});

Handler ScanWidgetHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ScanWidget();
});
Handler BasicViewOnDrawHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BasicViewOnDraw();
});

Handler BasicGridHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BasicGrid();
});


Handler SliverPageDetailsHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SliverPageDetails();
});


Handler MixtureAnimationHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MixtureAnimation();
});
