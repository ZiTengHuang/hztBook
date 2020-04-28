import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/models/post.dart';
import 'package:tt_book/provider/count_provider.dart';
import 'package:tt_book/provider/gridData_provider.dart';

class BasicGrid extends StatefulWidget {
  @override
  _BasicGridState createState() => _BasicGridState();
}

class _BasicGridState extends State<BasicGrid> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        title: Text('GridProvider'),
      ),
      body: Column(
        children: <Widget>[

          Container(
              color: Colors.black,
              padding: EdgeInsets.all(10),
              height: height * 0.2,
              width: double.maxFinite,
              child: Consumer<GridDataProvider>(builder: (_, notifier, child) {
                return GridView.builder(
                    itemCount: notifier.dataLength,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        maxCrossAxisExtent: 50),
                    itemBuilder: (context, index) {
                      return _gridItem(
                          index, Provider.of<GridDataProvider>(context).data);
                    });
              })),
          _wdema(),

          Container(
            color: Colors.blue,
            height: height * 0.6,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: 120,
                  child: NavigatorLeftBar(),
                ),
                ContextShow(),

              ],
            ),
          ),
        ],
      ),
    );
  }


  _wdema(){
    return Consumer2<CountProvider,GridDataProvider>(builder: (context,notifier,notifier2,_){
      return Text('${notifier.value}');
    });
  }
  _gridItem(index, List<Post> data) {
    return Consumer<GridDataProvider>(builder: (_, notifier, child) {
      return GestureDetector(
        onTap: () {
          notifier.deleteData(index);
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
          ),
          child: Text(
            data[index].title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}

class NavigatorLeftBar extends StatefulWidget {
  @override
  _NavigatorLeftBarState createState() => _NavigatorLeftBarState();
}

class _NavigatorLeftBarState extends State<NavigatorLeftBar> {
  int leftClickIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _leftButton(index);
        });
  }

  _leftButton(index) {
    bool isClick = false;
    isClick = (index == leftClickIndex) ? true : false;
    return Consumer<GridDataProvider>(builder: (_, notifier, __) {
      return GestureDetector(
        onTap: () {
          setState(() {
            leftClickIndex = index;
          });
          notifier.getIndexData(index);
        },
        child: Container(
          height: 45,
          width: 120,
          decoration: BoxDecoration(
              color: isClick ? Colors.red : Colors.white,
              border: Border(
                  bottom: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: isClick ? Colors.red : Colors.blue,
              ))),
          child: Text(
            'heihei ${index}',
            style: TextStyle(
              color: isClick ? Colors.white : Colors.lightGreen,
            ),
          ),
        ),
      );
    });
  }
}

class ContextShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GridDataProvider>(
      builder: (_, notifier, __) {
        return Container(
          alignment: Alignment(0,0),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(notifier.indexData.imageUrl),
                  fit: BoxFit.contain)),
          child: Text(notifier.indexData.title),
        );
      },
    );
  }
}
