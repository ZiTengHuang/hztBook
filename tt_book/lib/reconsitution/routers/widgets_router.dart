
import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:tt_book/reconsitution/routers/router_init.dart';
import 'package:tt_book/widget/customer/refresh/cold_page.dart';

class WidgetsRouter  extends IRouterProvider{

//  String customWeb = "/CustomWeb";
  String coldPage = "/ColdPage";

  @override
  void initRouter(Router router) {
    // TODO: implement initRouter
//     router.define(customWeb, handler:Handler(handlerFunc: (_,params)=> CustomWeb()));
     router.define(coldPage, handler: Handler(handlerFunc: (_,params)=>ColdPage()));
  }
}