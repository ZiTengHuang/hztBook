import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/widget/page/WidgetsPage.dart';

import 'home_page_layout.dart';
import 'jacksman.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final pageController = PageController();

  final List<Widget> tabBodies = [
//  TaobaoViewAdvance(),
    HomePage(),
//  OrderPage(),
    WidgetsPage(),
    HomePage(),
    JacksmanPage(),
    WidgetsPage(),
  ];

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: tabBodies,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: FlipBoxBar(
            selectedIndex: selectedIndex,
            items: [
              FlipBarItem(
                  icon: Icon(Icons.map),
                  text: Text("主页"),
                  frontColor: Colors.blue,
                  backColor: Colors.blueAccent),
              FlipBarItem(
                  icon: Icon(Icons.add),
                  text: Text("Add"),
                  frontColor: Colors.cyan,
                  backColor: Colors.cyanAccent),

              FlipBarItem(
                  icon: Icon(Icons.chrome_reader_mode),
                  text: Text("Read"),
                  frontColor: Colors.orange,
                  backColor: Colors.orangeAccent),

              FlipBarItem(
                  icon: Icon(Icons.print),
                  text: Text("Print"),
                  frontColor: Colors.purple,
                  backColor: Colors.purpleAccent),

              FlipBarItem(
                  icon: Icon(Icons.weekend),
                  text: Text('控件'),
                  frontColor: Colors.pink,
                  backColor: Colors.pinkAccent),
            ],

            onIndexChanged: (newIndex) {
              onTap(newIndex);
              setState(() {
                selectedIndex = newIndex;
              });
            },
          ),
        ),
      ),
    );
  }
}
