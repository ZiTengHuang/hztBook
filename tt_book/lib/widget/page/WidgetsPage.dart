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
      new widgetsModel('', '日你哥dj', icon: Icon(Icons.translate)),
      new widgetsModel('', '日你哥dj', icon: Icon(Icons.translate)),
      new widgetsModel('', '日你哥dj', icon: Icon(Icons.translate)),
      new widgetsModel('', '日你哥dj', icon: Icon(Icons.translate)),
      new widgetsModel('FruitheroPage', '水果ui', icon: Icon(Icons.fiber_manual_record)),
      new widgetsModel('MeasurePage', '测量用例', icon: Icon(Icons.fiber_manual_record)),
      new widgetsModel('HeroPage', 'Hero动画', icon: Icon(Icons.text_rotation_angleup)),
      new widgetsModel('CustomPaintDemo', '棋盘界面', icon: Icon(Icons.color_lens)),
      new widgetsModel('Lottie', 'Lottie动画', icon: Icon(Icons.local_laundry_service)),
      new widgetsModel('OnBoardingPage', '引导页',
          icon: Icon(
            Icons.pages,
            color: Colors.pink,
          ),
          color: Colors.green),
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
            onTap: (){

            },
            child: Row(
              children: <Widget>[

              ],
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
