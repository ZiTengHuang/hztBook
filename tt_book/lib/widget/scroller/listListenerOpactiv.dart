import 'package:flutter/material.dart';



/// appbar 实现滚动渐变
const APPBAR_SCROLL_OFFSET=100;
class ListListenerOpactiv extends StatefulWidget {
  @override
  _ListListenerOpactivState createState() => _ListListenerOpactivState();
}

class _ListListenerOpactivState extends State<ListListenerOpactiv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Stack(
            children: <Widget>[
              NotificationListener(
                onNotification: (scrollNotification){
                    ///如果是列表滚动的 并且是坚听的元素是0  也就是listview的时候

                    if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth ==0){
                        _onScroll(scrollNotification.metrics.pixels);
                    }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 220,
                      width: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Colors.amber,

                          )

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: _NavitorBar(),
              )
            ],
          )),
    );
  }

  _NavitorBar() {
    return  Container(
        margin: EdgeInsets.only(top: 40),
        height: 50,
        color: Color.fromARGB((appBarAlpha * 255).toInt(),255, 255, 255),
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.arrow_back,
                color: appBarAlpha <=0.2 ? Colors.white :Colors.black,
              ),
              Text('测试'),
              Icon(
                Icons.menu,
                color: appBarAlpha <=0.2 ? Colors.white :Colors.black,
              ),
            ],
          ),
        ),
    );
  }
  double appBarAlpha = 0;
  void _onScroll(double pixels) {
    double alpha = pixels / APPBAR_SCROLL_OFFSET;
    if(alpha <0){
       alpha = 0;
    }else if(alpha >1){
        alpha =1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(pixels);
  }
}
