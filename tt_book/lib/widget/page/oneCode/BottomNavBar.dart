import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../MeasurePage.dart';
import 'NewsPaperPage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  //State class
   GlobalKey _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _tabBodies = [
    NewsPaperPage(),
    MeasurePage(),
    NewsPaperPage()
  ];

  void pageTo(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(

          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            setState(() {
               pageTo(index);

            });
          },
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _tabBodies,
          scrollDirection: Axis.vertical,
        ));
  }
}
