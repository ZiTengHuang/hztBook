import 'package:flutter/material.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';

///冷页面，主要实现pageview+ animation

class ColdPage extends StatefulWidget {
  @override
  _ColdPageState createState() => _ColdPageState();
}

class paramInfo {
  final String title;
  final int index;
  final int type;

  paramInfo({this.title, this.index, this.type});
}

class _ColdPageState extends State<ColdPage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  PageController _pageController;
  var isPageCanChangedFinish = true;

  List<paramInfo> boidoTabs = [
    new paramInfo(title: "钻石", type: 1),
    new paramInfo(title: "水晶", type: 2),
    new paramInfo(title: "玛瑙", type: 3),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: boidoTabs.length, vsync: this);
    _pageController = new PageController(initialPage: 0);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        onPageChange(_tabController.index, pageController: _pageController);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  onPageChange(int index,
      {PageController pageController, TabController tabController})async {
    if (pageController != null) {
      setState(() {});
      //判断是哪一个切换
      isPageCanChangedFinish = false;
      await pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      isPageCanChangedFinish = true;
    } else {
      if (isPageCanChangedFinish) {
        setState(() {});
        tabController.animateTo(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(
          context: context,
          title: "钻石钻石✨",
          bottom: TabBar(
            tabs: boidoTabs.map((tab) {
              return Tab(
                text: tab.title,
              );
            }).toList(),
            controller: _tabController,
          )),
      body: PageView(
        controller: _pageController,
        onPageChanged: (position) {
          onPageChange(position, tabController: _tabController);
        },
        children: boidoTabs.map((value) {
          return Center(
            child: Text(value.title),
          );
        }).toList(),
      ),
    );
  }
}
