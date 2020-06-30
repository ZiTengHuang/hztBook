import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/reconsitution/routers/home_router.dart';
import 'package:tt_book/routers/routes.dart';
import 'package:tt_book/widget/page/my_page_layout.dart';

import 'application.dart';

/// fluro的路由跳转工具类
/// navigateTo 这个模式 有个属性叫做replace 替换一般用于回到主界面
class NavigatorUtils {
  static push(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transitionType = TransitionType.native}) {
    FocusScope.of(context).unfocus();
    FluroApplication.router.navigateTo(context, path,
        replace: replace, clearStack: clearStack, transition: transitionType);
  }

  static pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    FluroApplication.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print('$error');
    });
  }

  /// 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  /// 跳到WebView页
  static goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context,
        '/webview?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }

  ///
  static goHome(BuildContext context) {
    FluroApplication.router.navigateTo(context, HomeRouter.home, replace: true);
  }
}
