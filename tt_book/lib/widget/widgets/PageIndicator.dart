import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/widget/provide/indexNotifier.dart';

class PageIndicator extends StatefulWidget {
  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  _indicator(bool isActive) {
    return Container(
      height: 5,
      width: 40,
      margin: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive ? Colors.black : Colors.transparent,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider
        .of<IndexNotifier>(context)
        .index;

    List<Widget> _buildIndicator() {
      List<Widget> indicators = new List();

      for (int i = 0; i < 3; i++) {
        indicators.add(
            i == currentIndex ? _indicator(true) : _indicator(false)
        );
      }
      return indicators;
    }

    return  Row(
          children: _buildIndicator(),

    );
  }
}
