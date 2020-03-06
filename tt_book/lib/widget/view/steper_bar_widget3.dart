import 'package:flutter/material.dart';
import 'CommonVariables.dart';

class SteperBarWidget3 extends StatefulWidget {
  final int initSelection;

  const SteperBarWidget3({Key key, this.initSelection}) : super(key: key);

  @override
  _SteperBarWidget3State createState() => _SteperBarWidget3State();
}

class _SteperBarWidget3State extends State<SteperBarWidget3> {
  List<String> tempText = [
    '呵呵',
    '呵呵',
    '呵呵',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshFunc(3);
  }

  @override
  Widget build(BuildContext context) {
    print(ratio(context));
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          topNavigationBar(tempText),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: OneCodeStep(),
          )
        ],
      ),
    ));
  }

  List<String> listPng = [
    'images/AddNewListings/活动专题.png',
    'images/AddNewListings/基本.png',
    'images/AddNewListings/联系人.png',
  ];
  List<String> listPngele = [
    'images/AddNewListings/活动专题_ele.png',
    'images/AddNewListings/基本_ele.png',
    'images/AddNewListings/联系人_ele.png',
  ];

  List<String> listPngValue = [
    'images/AddNewListings/活动专题_ele.png',
    'images/AddNewListings/基本.png',
    'images/AddNewListings/联系人.png',
  ];

  List<Color> listColorValue = [
    Color(0xFFFFDED9),
    Color(0xFFFFDED9),
    Color(0xFFF2F5F8),
    Color(0xFFF2F5F8),
    Color(0xFFF2F5F8),
    Color(0xFFF2F5F8),
  ];

  List<Widget> listText = [];

  Container topNavigationBar(List<String> listTitle) {
    listText.clear();
    for (int i = 0; i < listTitle.length; i++) {
      if (i == 0) {
        listText
            .add(scheduleText(str: listTitle[i], left: 16 * ratio(context)));
      } else {
        listText
            .add(scheduleText(str: listTitle[i], left: 70 * ratio(context)));
      }
    }

    //





    return Container(
      width: screenWidth(context),
      height: 88 * ratio(context),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // 分类以及进度
          Container(
            width: screenWidth(context),
            height: 88 * ratio(context),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listText,
                  ),
                ),
              ],
            ),
          ),

          // 分割线
          // splitLineView(),
        ],
      ),
    );
  }

  // 进度文本
  Container scheduleText({@required String str, double left}) {
    if (left == null) left = 0;
    return Container(
      margin: EdgeInsets.only(left: left, top: 5 * ratio(context)),
      height: 17 * ratio(context),
      width: 69 * ratio(context),
      child: Center(
        child: Text(
          str,
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 12 * ratio(context),
          ),
        ),
      ),
    );
  }

// 进度线
  Container scheduleLine(
      {@required double width, Color color, double left, double right}) {
    if (color == null) color = Color(0xFFF2F5F8);
    if (left == null) left = 0;
    if (right == null) right = 0;
    return Container(
      margin:
          EdgeInsets.only(left: left, top: 34 * ratio(context), right: right),
      height: 2 * ratio(context),
      width: width,
      color: color,
    );
  }

  // 进度按钮
  Container scheduleButton({@required String png, Function ontop, Key key}) {
    return Container(
      key: key,
      margin: EdgeInsets.only(top: 19 * ratio(context)),
      width: 29 * ratio(context),
      height: 29 * ratio(context),
      child: GestureDetector(
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.5), // 圆角
            // color: Color(0xFFFFDED9),                       // 背景颜色
            image: DecorationImage(
              // 背景图片
              image: AssetImage(png),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 点击松手触发
        onTap: () {
          ontop();
        },
      ),
    );
  }

  List<Widget> listWidget() {
    List<Widget> list = [
      scheduleLine(
          width: 28 * ratio(context),
          color: listColorValue[0],
          left: 8 * ratio(context)),
      scheduleButton(
          png: listPngValue[0],
          key: Key('0'),
          ontop: () {
            refreshFunc(0);
          }),
      scheduleLine(width: 110 * ratio(context), color: listColorValue[1]),
      scheduleButton(
          png: listPngValue[1],
          key: Key('1'),
          ontop: () {
            refreshFunc(1);
          }),
      scheduleLine(width: 110 * ratio(context), color: listColorValue[2]),
      scheduleButton(
          png: listPngValue[2],
          key: Key('2'),
          ontop: () {
            refreshFunc(2);
          }),
      scheduleLine(width: 28 * ratio(context), color: listColorValue[3]),
    ];

    return list;
  }

  refreshFunc(int _index) {
    List<String> _listPngValue = [];
    List<Color> _listColorValue = [
      Color(0xFFFFDED9),
    ];
    int length = tempText.length;
    for (var i = 0; i < length; i++) {
      if (i <= _index) {
        _listPngValue.add(listPngele[i]);
        _listColorValue.add(Color(0xFFFFDED9));
      } else {
        _listPngValue.add(listPng[i]);
        _listColorValue.add(Color(0xFFF2F5F8));
      }
    }
    setState(() {
      listPngValue = _listPngValue;
      listColorValue = _listColorValue;
    });
  }
}

class OneCodeStep extends StatefulWidget {
  @override
  _OneCodeStepState createState() => _OneCodeStepState();
}

class _OneCodeStepState extends State<OneCodeStep> {



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
