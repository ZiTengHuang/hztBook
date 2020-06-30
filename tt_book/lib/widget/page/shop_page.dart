import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tt_book/models/post.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';

class NavigatorLeftInfo {
  final String title;
  final int id;

  NavigatorLeftInfo(this.title, this.id);
}

///商品列表界面
class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    double screentWidth = MediaQuery.of(context).size.width;
    double screentHeight = MediaQuery.of(context).size.height;
    double rpx = screentWidth / 750;

    return Scaffold(
      appBar: AppTitleBar(
          context: context,
          title: "商品列表",
          centTitle: true,
          actions: [
            IconButton(icon: Icon(CupertinoIcons.search), onPressed: () {})
          ]),
      body: Row(
        children: <Widget>[
          NavigatorLeftMenu(),
          NavigatorContent(),
        ],
      ),
    );
  }
}

class NavigatorContent extends StatefulWidget {
  @override
  _NavigatorContentState createState() => _NavigatorContentState();
}

class _NavigatorContentState extends State<NavigatorContent> {
  @override
  Widget build(BuildContext context) {
    double screentWidth = MediaQuery.of(context).size.width;
    double screentHeight = MediaQuery.of(context).size.height;

    double rpx = screentWidth / 750;
    return Container(
      width: screentWidth * 0.74,
      height: double.infinity,
      color: Colors.white,
      child: Swiper(
        itemCount: posts.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 50 * rpx, bottom: 50 * rpx),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30 * rpx),
                    height: 160 * rpx,
                    width: double.infinity,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GridView.count(
                    padding: EdgeInsets.all(8),
                    physics: new NeverScrollableScrollPhysics(),
                    primary: false,
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    children: posts.map((v) {
                      return gridItem(v, rpx);
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget gridItem(Post post, rpx) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12 * rpx),
          child: Container(
            height: 140 * rpx,
            width: 140 * rpx,
            child: Image.network(
              post.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          post.title,
          style: GoogleFonts.asap(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            letterSpacing: 1.2,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class NavigatorLeftMenu extends StatefulWidget {
  @override
  _NavigatorLeftMenuState createState() => _NavigatorLeftMenuState();
}

class _NavigatorLeftMenuState extends State<NavigatorLeftMenu> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<NavigatorLeftInfo> _navigatorItem = [
    new NavigatorLeftInfo("黄金", 1),
    new NavigatorLeftInfo("珠宝", 2),
    new NavigatorLeftInfo("钻石", 3),
    new NavigatorLeftInfo("祖母", 4),
    new NavigatorLeftInfo("玛瑙绿", 5),
    new NavigatorLeftInfo("金币", 6),
    new NavigatorLeftInfo("银子", 7),
    new NavigatorLeftInfo("群众", 8),
    new NavigatorLeftInfo("群众", 9),
    new NavigatorLeftInfo("群众", 10),
    new NavigatorLeftInfo("群众", 11),
    new NavigatorLeftInfo("群众", 12),
    new NavigatorLeftInfo("群众", 13),
    new NavigatorLeftInfo("群众", 14),
    new NavigatorLeftInfo("群众", 15),
    new NavigatorLeftInfo("群众", 16),
  ];
  int itemClickIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screentWidth = MediaQuery.of(context).size.width;
    double screentHeight = MediaQuery.of(context).size.height;
    double rpx = screentWidth / 750;
    return Container(
        height: double.infinity,
        width: screentWidth * 0.26,
        child: ScrollablePositionedList.builder(
          reverse: false,
          itemCount: posts.length,
          itemBuilder: (context, index) => item(index, rpx),
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ));
  }

  /// 侧边标题style
  Widget item(index, rpx) {
    bool isClick = false;
    isClick = itemClickIndex == index ? true : false;

    return GestureDetector(
      onTap: () {
        setState(() {
          itemScrollController.jumpTo(index: index, alignment: 0.5);
//          itemScrollController.scrollTo(
//              index: index,
//              duration: Duration(seconds: 2),
//              curve: Curves.easeInOutCubic);
          itemClickIndex = index;
        });
      },
      child: Container(
        height: 100 * rpx,
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          color: isClick ? Colors.white : Color(0xfff7f7f7),
          border: Border(
            bottom: BorderSide(
                color: isClick ? Color(0xfff7f7f7) : Color(0xfff7f7f7),
                width: 1,
                style: BorderStyle.solid),
          ),
        ),
        child: Text(
          _navigatorItem[index].title,
          style: GoogleFonts.asap(
            color: isClick ? Colors.blueAccent : Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
