import 'package:flutter/material.dart';


class MyEngelish extends StatefulWidget {
  @override
  _MyEngelishState createState() => _MyEngelishState();
}

class _MyEngelishState extends State<MyEngelish> {
  @override
  Widget build(BuildContext context) {
    return Theme(
       data: ThemeData(
         primaryColor: Colors.amber
       ),
       child: Scaffold(
          appBar:AppBar(
            title: Text('单词'),
          ),
        body: ListView(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
