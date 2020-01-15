import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/widget/page/AnimationPages/Lottie.dart';
import 'package:tt_book/widget/page/AnimationPages/hero.dart';
import 'package:tt_book/widget/page/MeasurePage.dart';
import 'package:tt_book/widget/page/fruitheros/fruithero_page.dart';
import 'package:tt_book/widget/page/launchePage/Onboarding.dart';
import 'package:tt_book/widget/provide/indexNotifier.dart';
import 'package:tt_book/widget/view/CustomPaintDemo.dart';

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
