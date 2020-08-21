import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt_book/common/LocalStorage.dart';
import 'package:tt_book/models/jsonExample.dart';
import 'package:tt_book/provider/goods_provider.dart';
import 'package:tt_book/provider/gridData_provider.dart';
import 'package:tt_book/provider/theme_provider.dart';
import 'package:tt_book/reconsitution/routers/application.dart';
import 'package:tt_book/routers/Application.dart';
import 'package:tt_book/routers/routes.dart';
import 'package:tt_book/util/CommonUtils.dart';
import 'package:tt_book/value/AppConfigValue.dart';
import 'package:tt_book/widget/page/my_page_layout.dart';
import 'package:tt_book/widget/provide/countr_provide.dart';
import 'package:tt_book/reconsitution/routers/routers.dart';

import 'common/HYSizeFit.dart';

const String SHOW_GUILD_TIPS = 'showGuildTips';
bool hasShowGuild;

void main() async {
  /// 确保flutter 应用已经起来了。在调用之后的内容
  WidgetsFlutterBinding.ensureInitialized();
//  SharedPreferences prefs = await SharedPreferences.getInstance();
  SpUtil sp = await SpUtil.getInstance();
  initAppConfig();
  runApp(DynamicTheme(
    spUtil: sp,
    hasShowGuild: hasShowGuild,
  ));
}

initAppConfig() {
  String showGuildTips = SpUtil.getString(SHOW_GUILD_TIPS);
  String localVersion = CommonUtils.getVersion().toString();
  if (null == showGuildTips || showGuildTips != localVersion) {
    SpUtil.putString(SHOW_GUILD_TIPS, localVersion);
  }
  hasShowGuild = showGuildTips == localVersion;
}

class DynamicTheme extends StatefulWidget {
  final SpUtil spUtil;
  final bool hasShowGuild;

  const DynamicTheme({Key key, this.spUtil, this.hasShowGuild})
      : super(key: key);

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 由于SpUtil未初始化，所以MaterialApp获取的为默认主题配置，这里同步一下。
//      Provider.of<ThemeProvider>(context).syncTheme();
    });
    JsonExample jsonExample = new JsonExample();
    jsonExample.sendJsonPrint();
  }

  @override
  Widget build(BuildContext context) {
//    HYSizeFit.initialize(context);
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    FluroApplication.router = router;
    Routers2.configureRoutes(router);

    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(builder: (_, provider, __) {
        return MultiProvider(
          providers: [
//            ChangeNotifierProvider(
//                builder: (context) => IndexNotifier(), child: MainPage()),
            ChangeNotifierProvider<CounterProvide>(
                create: (_) => CounterProvide()),
            ChangeNotifierProvider<GridDataProvider>(
                create: (_) => GridDataProvider()),
//            Provider<CounterProvide>(create: (_)=>CounterProvide()),
            ChangeNotifierProvider<GoodsProvider>(
                create: (_) => GoodsProvider())
          ],
          child: MaterialApp(
            title: '小黄书院',
            color: Colors.amber,
            theme: provider.getTheme(),
            darkTheme: ThemeData.dark(),
            themeMode: provider.lightMode == 0 ? ThemeMode.light : ThemeMode.dark,
            home: MainPage(),
          ),
        );
      }),
    );
  }
}
