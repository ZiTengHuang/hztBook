
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/reconsitution/routers/home_router.dart';
import 'package:tt_book/reconsitution/routers/router_init.dart';
import 'package:tt_book/reconsitution/routers/widgets_router.dart';
import 'package:tt_book/widget/customer/web/custom_web.dart';
import 'package:tt_book/widget/page/my_page_layout.dart';
import '404.dart';


class Routers2 {

    static String home = "/home";
    static String webViewPage = "/webview";
    static List<IRouterProvider> _listRouters = [];

    static void configureRoutes(Router router){

      /// 指定路由跳转错误返回页
      router.notFoundHandler = Handler(
          handlerFunc: (BuildContext context, Map<String, List<String>> params) {
            debugPrint('未找到目标页');
            return WidgetNoFound();
          });

      router.define(home, handler: Handler(
          handlerFunc: (BuildContext context, Map<String, List<String>> params) => MainPage()));

       ///跳转到webview
      router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
        String title = params['title']?.first;
        String url = params['url']?.first;
        return CustomWeb(title: title, url: url);
      }));

        _listRouters.clear();
      /// 各自路由由各自模块管理，统一在此添加初始化
      _listRouters.add(HomeRouter());
      _listRouters.add(WidgetsRouter());

      ///迭代每一个路由并把router传递！
      _listRouters.forEach((routerProvider){
           routerProvider.initRouter(router);
      });

    }
}