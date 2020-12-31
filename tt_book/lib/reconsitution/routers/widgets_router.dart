import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:tt_book/common/refresh/pullRefreshState.dart';
import 'package:tt_book/reconsitution/routers/router_init.dart';
import 'package:tt_book/widget/customer/DownOpenImg.dart';
import 'package:tt_book/widget/customer/PackRefresh.dart';
import 'package:tt_book/widget/customer/PrettyBottomBar.dart';
import 'package:tt_book/widget/customer/refresh/cold_page.dart';

class WidgetsRouter extends IRouterProvider {
//  String customWeb = "/CustomWeb";
  String coldPage = "/ColdPage";
  String prettyBottomBar = "/PrettyBottomBar";
  String packRefresh = "/PackRefresh";
  String downOpenImg = "/DownOpenImg";
  String pullRefreshState = "/PullRefreshState";

  @override
  void initRouter(Router router) {
    // TODO: implement initRouter
//     router.define(customWeb, handler:Handler(handlerFunc: (_,params)=> CustomWeb()));
    router.define(coldPage,
        handler: Handler(handlerFunc: (_, params) => ColdPage()));
    router.define(prettyBottomBar,
        handler: Handler(handlerFunc: (_, params) => PrettyBottomBar()));
    router.define(packRefresh,
        handler: Handler(handlerFunc: (_, params) => PackRefresh()));
    router.define(downOpenImg,
        handler: Handler(handlerFunc: (_, params) => DownOpenImg()));

    router.define(pullRefreshState,
        handler: Handler(handlerFunc: (_, params) => PullRefreshState()));
  }
}
