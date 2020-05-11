import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/common/LocalStorage.dart';
import 'package:tt_book/common/common.dart';
import 'package:tt_book/common/themes.dart';
import 'package:tt_book/res/colors.dart';
import 'package:tt_book/res/styles.dart';

class THEMEMODE {
  static const int DARK = 1;
  static const int LIGHT = 0;
}

class ThemeProvider extends ChangeNotifier {
  int lightMode = THEMEMODE.LIGHT;


  ThemeProvider(){
    lightMode =  SpUtil.getInt('dark',defValue: 3);
    print(lightMode);
  }

  static const Map<Themes, String> themes = {
    Themes.DARK: "Dark",
    Themes.LIGHT: "Light",
    Themes.SYSTEM: "System"
  };

  void setTheme(Themes theme) {
    SpUtil.putString(Constant.theme, themes[theme]);
    notifyListeners();
  }



  void changeThemeModel(){
    lightMode = lightMode == THEMEMODE.DARK ? THEMEMODE.LIGHT : THEMEMODE.DARK;
//    LocalStorage.save('dark', lightMode);
    SpUtil.putInt('dark', lightMode).then((_){
      notifyListeners();
      print(SpUtil.getInt('dark'));
    });
  }




  getTheme({bool isDarkMode: false}) {
    lightMode =  SpUtil.getInt('dark');
//    print('theme::${theme}');
//    print(lightMode);
    switch (lightMode) {
      case 0:
        isDarkMode = false;
        break;
      case 1:
        isDarkMode = true;
        break;
      default:
        break;
    }

    return ThemeData(
//        errorColor: isDarkMode ? Colours.dark_red : Colours.red,
//        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: Colours.app_main,
//        accentColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
//        // Tab指示器颜色
//        indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
//        // 页面背景色
//        scaffoldBackgroundColor:
//            isDarkMode ? Colours.dark_bg_color : Colors.white,
//        // 主要用于Material背景色
//        canvasColor: isDarkMode ? Colours.dark_material_bg : Colors.white,
//        // 文字选择色（输入框复制粘贴菜单）
//        textSelectionColor: Colours.app_main.withAlpha(70),
//        textSelectionHandleColor: Colours.app_main,
//        textTheme: TextTheme(
//          // TextField输入文字颜色
//          subhead: isDarkMode ? TextStyles.textDark : TextStyles.text,
//          // Text文字样式
//          body1: isDarkMode ? TextStyles.textDark : TextStyles.text,
//          subtitle:
//              isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
//        ),
//        inputDecorationTheme: InputDecorationTheme(
//          hintStyle:
//              isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
//        ),
//        appBarTheme: AppBarTheme(
//          elevation: 0.0,
//          color: isDarkMode ? Colours.dark_button_disabled : Colours.button_disabled,
//          brightness: isDarkMode ? Brightness.dark : Brightness.light,
//        ),
//        dividerTheme: DividerThemeData(
//            color: isDarkMode ? Colours.dark_line : Colours.line,
//            space: 0.6,
//            thickness: 0.6),
//        cupertinoOverrideTheme: CupertinoThemeData(
//          brightness: isDarkMode ? Brightness.dark : Brightness.light,
//        )
        );
  }
}
