
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:tt_book/reconsitution/routers/router_init.dart';
import 'package:tt_book/widget/customer/web/custom_web.dart';

class WidgetsRouter  extends IRouterProvider{

  String customWeb = "/CustomWeb";

  @override
  void initRouter(Router router) {
    // TODO: implement initRouter
     router.define(customWeb, handler:Handler(handlerFunc: (_,params)=> CustomWeb()));

  }
}