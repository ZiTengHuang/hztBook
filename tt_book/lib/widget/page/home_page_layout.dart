import 'package:flutter/material.dart';
import 'package:tt_book/common/themes.dart';
import 'package:tt_book/models/place_model.dart';
import 'package:tt_book/provider/theme_provider.dart';
import 'package:tt_book/widget/page/place_screen.dart';
import 'package:provider/provider.dart';

import 'common/banner_layout.dart';

const Color backgroudundColor = Color(0xff4a4a58);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double screenHeight, screenWidth;
  final Duration _duration = Duration(milliseconds: 500);
  AnimationController _controller;
  bool isCollapsed = true;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  int _searchType = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);

    /// scale 比例     比例动画从1 开始到缩小到 80% 范围
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Column _buildPopularPlaces() {
    List<Widget> popularPlaces = [];
    places.forEach((place) {
      popularPlaces.add(Container(
        height: 80,
        child: ListTile(
          leading:
              Hero(tag: place.imageUrl, child: Image.asset(place.imageUrl)),
          title: Text(
            place.city,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            ' ${place.country} Animation',
            style: TextStyle(color: Colors.white),
          ),
          trailing: InkResponse(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PlaceScreen(
                            place: place,
                          )));
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Color(0xfffaf6f1),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ),
      ));
    });
    return Column(
      children: popularPlaces,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[],
                ),
              ),
              Container(
                width: screenWidth * 0.5,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.accessibility_new,
                        color: Colors.white,
                      ),
                      title: Text('是谁的心呐'),
                      onTap: () {},
                      onLongPress: () {
                        print('changan');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.accessibility_new,
                        color: Colors.white,
                      ),
                      title: Text('被孤单留下'),
                      onTap: () {},
                      onLongPress: () {
                        print('changan');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.accessibility_new,
                        color: Colors.white,
                      ),
                      title: Text('他还好吗'),
                      onTap: () {},
                      onLongPress: () {
                        print('changan');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.accessibility_new,
                        color: Colors.white,
                      ),
                      title: Text('比泪水坚强'),
                      onTap: () {},
                      onLongPress: () {
                        print('changan');
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dashboard(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: backgroudundColor,
          borderRadius: isCollapsed
              ? BorderRadius.all(Radius.circular(0))
              : BorderRadius.all(Radius.circular(30)),
          elevation: 9,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 45, left: 13, right: 13),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();
                          isCollapsed = !isCollapsed;
                        });
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '小黄ui example',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: BannerLayout(),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Book unique homes and experiences',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        color: _searchType == 1 ? Color(0xffffc05f) : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(
                                color: _searchType == 1
                                    ? Colors.transparent
                                    : Color(0xffd2d1d6))),
                        onPressed: () {
                          Provider.of<ThemeProvider>(context).setTheme(
                              _searchType == 0
                                  ? Themes.SYSTEM
                                  : (_searchType == 1
                                      ? Themes.DARK
                                      : Themes.LIGHT));

                          setState(() {
                            _searchType = 1;
                          });
                        },
                        child: Text('😊😊😊'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      FlatButton(
                        color: _searchType == 0 ? Color(0xffffc05f) : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(
                                color: _searchType == 0
                                    ? Colors.transparent
                                    : Color(0xffd2d1d6))),
                        onPressed: () {
                          Provider.of<ThemeProvider>(context).setTheme(
                              _searchType == 0
                                  ? Themes.SYSTEM
                                  : (_searchType == 1
                                      ? Themes.DARK
                                      : Themes.LIGHT));
                          setState(() {
                            _searchType = 0;
                          });
                        },
                        child: Text('💩💩💩'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Why',
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xffeef8ff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.location_on,
                            size: 25,
                            color: Color(0xff309df1),
                          ),
                        )),
                  ),
                  Divider(
                    height: 25,
                    color: Color(0xfff7f7f7),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'check --in  and check --out',
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xffeef8ff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.calendar_today,
                            size: 25,
                            color: Color(0xff309df1),
                          ),
                        )),
                  ),
                  Divider(
                    height: 25,
                    color: Color(0xfff7f7f7),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '1 Adults , 0 children , 1 Room',
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xffeef8ff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: Color(0xff309df1),
                          ),
                        )),
                  ),
                  Divider(
                    height: 25,
                    color: Color(0xfff7f7f7),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                      color: Color(0xff309df1),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '小黄一定要加油呢',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildPopularPlaces(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
