import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/provider/theme_provider.dart';
import 'package:tt_book/util/theme_utils.dart';


class ColorThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('切换颜色'),
        actions: <Widget>[
            IconButton(icon: ThemeUtils.isDark(context) ? Icon(Icons.brightness_7) : Icon(Icons.brightness_2 ), onPressed: (){
              Provider.of<ThemeProvider>(context).changeThemeModel();

            })
        ],
      ),
      body: ListView( 
         children: <Widget>[
           FlatButton(onPressed: (){
              Provider.of<ThemeProvider>(context).changeThemeModel();
           }, child: Text('黑暗模式')),
           FlatButton(onPressed: (){}, child: Text('红色'))
         ],
      ),
    );
  }
}
