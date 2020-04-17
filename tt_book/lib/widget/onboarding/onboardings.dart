import 'package:flutter/material.dart';

import 'onboardings_style_one.dart';


class OnBoardings extends StatefulWidget {
  @override
  _OnBoardingsState createState() => _OnBoardingsState();
}

class _OnBoardingsState extends State<OnBoardings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: <Widget>[
           OnboardingsStyleOne(),
         ],
       ),
    );
  }
}


