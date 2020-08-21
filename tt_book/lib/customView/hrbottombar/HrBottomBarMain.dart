import 'package:flutter/material.dart';

import 'HrBottomBarModel.dart';

enum BottomIcons { Home, Favorite, Search, Account }

class HrBottomBarMain extends StatefulWidget {
  @override
  _HrBottomBarMainState createState() => _HrBottomBarMainState();
}

class _HrBottomBarMainState extends State<HrBottomBarMain> {
  BottomIcons _bottomIcons = BottomIcons.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              alignment: Alignment.center,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    HrBottomBarModel(
                      isHrBottomBar: _bottomIcons == BottomIcons.Home,
                      icon: Icons.home,
                      text: '首页',
                      onPerson: (){
                         setState(() {
                             _bottomIcons = BottomIcons.Home;
                         });
                      },
                    ),       HrBottomBarModel(
                      isHrBottomBar: _bottomIcons == BottomIcons.Favorite,
                      icon: Icons.favorite,
                      text: '爱心',
                      onPerson: (){
                         setState(() {
                             _bottomIcons = BottomIcons.Favorite;
                         });
                      },
                    ),       HrBottomBarModel(
                      isHrBottomBar: _bottomIcons == BottomIcons.Search,
                      icon: Icons.search,
                      text: '搜索',
                      onPerson: (){
                         setState(() {
                             _bottomIcons = BottomIcons.Search;
                         });
                      },
                    ),
                    HrBottomBarModel(
                      isHrBottomBar: _bottomIcons == BottomIcons.Account,
                      icon: Icons.account_circle,
                      text: '我的',
                      onPerson: () {
                        setState(() {
                          _bottomIcons = BottomIcons.Account;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
