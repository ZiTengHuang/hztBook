import 'package:fluro/fluro.dart';
import 'package:tt_book/reconsitution/routers/router_init.dart';
import 'package:tt_book/subject/colorThemePage.dart';
import 'package:tt_book/widget/page/my_page_layout.dart';

class HomeRouter extends IRouterProvider {
  static String colorThemePage = '/ColorThemePage';
  static String home = '/home';
  @override
  void initRouter(Router router) {
    // TODO: implement initRouter

    router.define(colorThemePage, handler: Handler(handlerFunc: (_, params) => ColorThemePage()));
    router.define(home, handler: Handler(handlerFunc: (_, params) => MainPage()));

  }
}
