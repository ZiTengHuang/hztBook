import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/customView/hrbottombar/HrBottomBarMain.dart';
import 'package:tt_book/getx/getMainPage.dart';
import 'package:tt_book/guide/GuidePage.dart';
import 'package:tt_book/reconsitution/routers/router_init.dart';
import 'package:tt_book/subject/colorThemePage.dart';
import 'package:tt_book/widget/page/common/PickerUtils.dart';
import 'package:tt_book/widget/page/my_page_layout.dart';
import 'package:tt_book/widget/page/shopStore/CartTextPage.dart';
import 'package:tt_book/widget/provide/CartProvider.dart';

class HomeRouter extends IRouterProvider {
  static String colorThemePage = '/ColorThemePage';
  static String home = '/home';
  static String hrBottomBarMain = '/HrBottomBarMain';
  static String guidePage = '/GuidePage';
  static String pickerUtils = "/PickerUtils";
  static String cartTextPage = "/CartTextPage";
  static String getMainPage = "/GetMainPage";

  @override
  void initRouter(Router router) {
    // TODO: implement initRouter

    router.define(colorThemePage,
        handler: Handler(handlerFunc: (_, params) => ColorThemePage()));
    router.define(home,
        handler: Handler(handlerFunc: (_, params) => MainPage()));
    router.define(hrBottomBarMain,
        handler: Handler(handlerFunc: (_, params) => HrBottomBarMain()));
    router.define(guidePage,
        handler: Handler(handlerFunc: (_, params) => GuidePage()));
    router.define(pickerUtils,
        handler: Handler(handlerFunc: (_, params) => PickerUtils()));
    router.define(getMainPage,
        handler: Handler(handlerFunc: (_, params) => GetMainPage()));

    router.define(cartTextPage, handler: Handler(handlerFunc: (_, params) {
      return ChangeNotifierProvider<CartProvider>(
        create: (_) => CartProvider(),
        child: CartTextPage(),
      );
    }));
  }
}
