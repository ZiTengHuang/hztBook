import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
 class TikTokHomePage extends StatefulWidget {
  @override
  _TikTokHomePageState createState() => _TikTokHomePageState();
}

class _TikTokHomePageState extends State<TikTokHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TikTokMain(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.black),
          child: BottomBar(),
        ),
      ),
    );
  }
}

class TikTokMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            height: 120,
            width: screenWidth,
            child: Container(
              padding: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(color: Colors.black),
              child: TopBar(),
            )),
        Positioned(
            bottom: 0,
            width: 0.70 * screenWidth,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: BtnContent(),
            )),
        Positioned(
          width: 0.25 * screenWidth,
          height: 0.3 * screenHeight,
          child: Container(
            child: BtnList(),
          ),
          top: 0.37 * screenHeight,
          right: 0,
        ),
        Positioned(
            bottom: 10,
            right: 0,
            height: 100,
            width: 100,
            child: Container(
              child: RotateAlbum(),
            ))
      ],
    );
  }
}

class BtnContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '@人民日报',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              'asrfgdafsadfs人民日报人民日报dafsafsadnflasdfasdfslsadlf',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.music_note,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  width: 120,
                  child: MarqueeWidget(
                    scrollAxis: Axis.horizontal,
                    text: 'Some sample text that takes some space.',

                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  final List<Widget> bodis = [
    Text('关注'),
    Text('推荐'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {})),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TabBar(
              tabs: bodis,
              controller: _tabController,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 28),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey[700], fontSize: 22),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          flex: 8,
        ),
        Expanded(
            flex: 2,
            child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {})),
      ],
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _BottomBarContextStyle(true, '底部'),
        _BottomBarContextStyle(false, '消息'),
        AllIcons(),
        _BottomBarContextStyle(false, '通常'),
        _BottomBarContextStyle(false, '我'),
      ],
    );
  }

  _BottomBarContextStyle(bool isSelected, String text) {
    if (null == text) return '';
    TextStyle textStyleNormer = TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
    TextStyle textStyle = TextStyle(
        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400);
    return Text(text, style: isSelected ? textStyleNormer : textStyle);
  }
}

class AllIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
              height: 35,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.cyan,
                ),
              )),
          Positioned(
              right: 0,
              height: 35,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.pinkAccent,
                ),
              )),
          Positioned(
              right: 5,
              height: 35,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                ),
                child: Icon(Icons.add),
              )),
        ],
      ),
    );
  }
}

class RotateAlbum extends StatefulWidget {
  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    _animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: Icon(
        Icons.music_note,
        color: Colors.black,
      ),
    );
    _animationController.forward(from: 0.0);
    _animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.forward(from: 0.0);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _animation,
    );
  }
}

class BtnList extends StatefulWidget {
  @override
  _BtnListState createState() => _BtnListState();
}

class _BtnListState extends State<BtnList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          width: 60,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  child: Image.network(
                      'http://img2.imgtn.bdimg.com/it/u=808755091,4217824349&fm=15&gp=0.jpg'),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent),
                    child: Icon(Icons.add),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
