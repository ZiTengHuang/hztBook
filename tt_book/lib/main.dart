import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/models/jsonExample.dart';
import 'package:tt_book/provider/gridData_provider.dart';
import 'package:tt_book/provider/theme_provider.dart';
import 'package:tt_book/routers/Application.dart';
import 'package:tt_book/routers/routes.dart';
import 'package:tt_book/widget/page/home_page_layout.dart';
import 'package:tt_book/widget/page/launchePage/Onboarding.dart';
import 'package:tt_book/widget/page/my_page_layout.dart';
import 'package:tt_book/widget/provide/countr_provide.dart';
import 'package:tt_book/widget/provide/indexNotifier.dart';
import 'package:tt_book/widget/provide/offsetNotifier.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  ThemeData basicTheme = ThemeData(
    primaryColor: Colors.black26,
    brightness: Brightness.light,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SpUtil.getInstance();
      // 由于SpUtil未初始化，所以MaterialApp获取的为默认主题配置，这里同步一下。
      Provider.of<ThemeProvider>(context).syncTheme();
    });
    JsonExample jsonExample = new JsonExample();
    jsonExample.sendJsonPrint();
  }


  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child:Consumer<ThemeProvider >(builder: (_,provider,__){
        return  MultiProvider(providers: [
//            ChangeNotifierProvider(
//                builder: (context) => IndexNotifier(), child: MainPage()),
        ChangeNotifierProvider<CounterProvide>(create: (_) => CounterProvide()),
        ChangeNotifierProvider<GridDataProvider>(create:(_) => GridDataProvider()),
//            Provider<CounterProvide>(create: (_)=>CounterProvide()),
        ],child: MaterialApp(
            title: '小黄书院',
            color: Colors.amber,
            theme: provider.getTheme(),
            darkTheme: provider.getTheme(isDarkMode: false),
            home:  MainPage(),
        ),);
      }),
    );
  }
}
