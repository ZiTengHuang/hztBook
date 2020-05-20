import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/provider/goods_provider.dart';

class MyEngelish extends StatefulWidget {
  @override
  _MyEngelishState createState() => _MyEngelishState();
}

class _MyEngelishState extends State<MyEngelish> {
  bool showModel = true;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.amber),
      child: Scaffold(
        appBar: AppBar(
          title: Text('单词'),
        ),
        body: Consumer<GoodsProvider>(builder: (_, notifile, __) {
          return Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      notifile.add(23.0);
                    },
                    child: Text('点我增加23'),
                  ),
                  SizedBox(
                    height: 300,
                  ),

                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: height,
                  width: double.infinity,
                  color: Colors.amber,
                  child: ListView.builder(itemCount: 5,itemBuilder: (context,index){
                     return Container(
                       height: 50,
                       width: 300,
                       child: Text("$index"),
                     );
                  }),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if(height ==500){
                      height = 0;
                    }else{
                      height = 500;

                    }

                   });
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Text('悬浮结算条'),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
