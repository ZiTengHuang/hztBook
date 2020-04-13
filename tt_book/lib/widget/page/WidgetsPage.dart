import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/routers/Application.dart';
import 'package:tt_book/util/theme_utils.dart';
import 'package:tt_book/widget/provide/countr_provide.dart';

class WidgetsPage extends StatefulWidget {
  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class widgetsModel {
  final String nativePath;
  final String title;
  final Icon icon;
  final Color color;

  widgetsModel(this.nativePath, this.title,
      {this.icon = const Icon(Icons.build),
      this.color = const Color(0xfff7f7f7)});
}

class _WidgetsPageState extends State<WidgetsPage> {
  List<widgetsModel> gridModel = [];

  initData() {
    gridModel = [
      new widgetsModel('SteperBarWidget3', '步骤条', icon: Icon(Icons.short_text)),

      new widgetsModel('FruitheroPage', '水果ui',
          icon: Icon(Icons.fiber_manual_record)),
      new widgetsModel('MeasurePage', '测量用例',
          icon: Icon(Icons.fiber_manual_record)),
      new widgetsModel('HeroPage', 'Hero动画',
          icon: Icon(Icons.text_rotation_angleup)),
      new widgetsModel('CustomPaintDemo', '棋盘界面', icon: Icon(Icons.color_lens)),
      new widgetsModel('Lottie', 'Lottie动画',
          icon: Icon(Icons.local_laundry_service)),
      new widgetsModel('BottomNavBar', '底部导航', icon: Icon(Icons.border_bottom)),
      new widgetsModel('FrostedGlassDemo', '毛玻璃效果',
          icon: Icon(Icons.hourglass_empty)),
      new widgetsModel('SearchShow', '搜索效果', icon: Icon(Icons.hourglass_empty)),
      new widgetsModel('OnBoardingPage', '引导页',
          icon: Icon(
            Icons.pages,
            color: Colors.pink,
          ),
          color: Colors.green),
      new widgetsModel('LittleAnimation', '渐渐显示动画',
          icon: Icon(
            Icons.favorite,
            color: Colors.redAccent,
          ),
          color: Colors.green),
      new widgetsModel('TikTokHomePage', 'tiktok',
          icon: Icon(
            Icons.filter_tilt_shift,
            color: Colors.blue,
          ),
          color: Colors.yellow),
      new widgetsModel('DartBasic', 'Dart基础',
          icon: Icon(
            Icons.battery_std,
            color: Colors.cyan,
          ),
          color: Colors.yellow),

      new widgetsModel('FangyePage', '翻转动画',
          icon: Icon(
            Icons.battery_std,
            color: Colors.cyan,
          ),
          color: Colors.yellow),

      new widgetsModel('FavAnimation', '点赞效果',
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          color: Colors.yellow),

      new widgetsModel('ListListenerOpactiv', '滚动渐变',
          icon: Icon(
            Icons.line_style,
            color: Colors.amber,)),

      new widgetsModel('BasicGrid', 'grid 布局',
          icon: Icon(
            Icons.grid_on,
            color: Colors.cyan,
          ),
          color: Colors.yellow),

      new widgetsModel('BezierViewBasic', '贝赛尔教学',
          icon: Icon(
            Icons.beach_access,
            color: Colors.deepPurple,
          ),
          color: Colors.yellow),

      new widgetsModel('BezierExample', '贝赛尔实践',
          icon: Icon(
            Icons.beach_access,
            color: Colors.green,
          ),
          color: Colors.yellow),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print('build:重新调用');
    final counter = Provider.of<CounterProvide>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            widgetsGridPlant(
              gridModel: gridModel,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class widgetsGridPlant extends StatelessWidget {
  final List<widgetsModel> gridModel;
  final String title;

  const widgetsGridPlant({Key key, this.gridModel, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Row(
              children: <Widget>[],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80.0,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (gridModel[index].nativePath == null ||
                          gridModel[index].nativePath == '') return;

                      Application.router
                          .navigateTo(context, gridModel[index].nativePath);
                    },
                    onLongPress: () {},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ThemeUtils.getKeyboardActionsColor(context),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(gridModel[index].title),
                          gridModel[index].icon,
                        ],
                      ),
                    ),
                  );
                },
                itemCount: gridModel.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
