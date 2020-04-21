import 'package:flutter/material.dart';
import 'package:tt_book/widget/view/view_ondraw/basic_view_three.dart';

import 'basic_view_one.dart';
import 'basic_view_two.dart';

///draw和paint基础

class BasicViewOnDraw extends StatefulWidget {
  @override
  _BasicViewOnDrawState createState() => _BasicViewOnDrawState();
}

class _BasicViewOnDrawState extends State<BasicViewOnDraw>
    with TickerProviderStateMixin {
  final List<Tab> bodis = [
    new Tab(
      icon: Icon(Icons.calendar_view_day),
    ),
    new Tab(
      icon: Icon(Icons.format_paint),
    ),
    new Tab(
      icon: Icon(Icons.album),
    ),
  ];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: bodis.length, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.deepOrange),
      child: Scaffold(
        appBar: AppBar(
          title: Text('draw和paint基础'),
          bottom:TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: bodis,
            controller: _tabController,
          ) ,
        ),
        body: TabBarView(controller: _tabController, children: [
          BasicViewOne(),
          BasicViewTwo(),
          BasicViewThree(),
        ]),
      ),
    );
  }
}
