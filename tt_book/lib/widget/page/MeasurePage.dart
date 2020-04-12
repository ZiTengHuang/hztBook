import 'package:flutter/material.dart';

/// 测量用例
class MeasurePage extends StatefulWidget {
  @override
  _MeasurePageState createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    print('整个界面的大小');
    return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            color: Colors.pinkAccent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: size.height * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'asdf',
                            style: TextStyle(color: Colors.black),
                          ),    Text(
                            'asdf',
                            style: TextStyle(color: Colors.black),
                          ),    Text(
                            'asdf',
                            style: TextStyle(color: Colors.black),
                          ),    Text(
                            'asdf',
                            style: TextStyle(color: Colors.black),
                          ),    Text(
                            'asdf',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Positioned(
                  top: size.height * 0.4,
                  right: size.width * 0.0,
                  child: Image.asset(
                    'assets/images/plate1.png',
                    fit: BoxFit.contain,
                  ),
                  height: 250,
                  width: 250,
                ),
              ],
            )));
  }
}
