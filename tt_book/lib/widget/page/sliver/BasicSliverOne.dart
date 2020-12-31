import 'package:flutter/material.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';

class BasicSliverOne extends StatefulWidget {
  @override
  _BasicSliverOneState createState() => _BasicSliverOneState();
}

class _BasicSliverOneState extends State<BasicSliverOne> {


  List<String> float = [
    'fiexibleSpace:空间大小可变的组件',
    'float :向下滑动true的话即使当前customScrollview不在顶部，sliverbar也会跟着向下滑出'
        'snap：当手指放开时候，sliverbar会根据当前的位置进行调整，始终保持展开或收起的状态',
    'pinned 不同于float，当列表滑动屏幕外后，依旧固定sliverbar',
    'expandedHeight:展开时候appbar的高度',
    'CustomSliverView和sliver提供自定义滚动效果的组件',
    '里面必须使用sliverList和sliverGrid来协调使用',
    'Text必须使用sliverToBoxAdapter包裹才能在CustomScrollView中使用',
    'sliverAppBar',
    'sliverPersistentHeader',
    'sliverFillRemaining',
    'sliverToBoxAdapter',
    'sliverPadding',
  ];
  List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.lightBlue,
    Colors.pink,
    Colors.teal,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.green
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var o in float) {
      print(o);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Color(0xfff7f7f7),
            title: Text('asdfsaf'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.graphic_eq), onPressed: null)
            ],
            floating: true,
            snap: false,
            pinned: true,
            expandedHeight: 222,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(
                top: 0,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22),
                        )),
                    height: 222,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120,left: 20,right: 20),
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _renderTitle('sliverList'),
          _sliverList(),
          _renderTitle('slivergird'),
          _sliverGrid(),
        ],
      ),
    );
  }

  _renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }

  _sliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        alignment: Alignment.center,
        height: 60,
        child: Text(
          float[index],
          style: TextStyle(color: colorList[index]),
          textAlign: TextAlign.center,
        ),
      );
    }, childCount: float.length));
  }

  _sliverGrid() {
    return SliverGrid(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          height: 50,
          width: 50,
          color: colorList[index],
        );
      }, childCount: colorList.length),
    );
  }
}
