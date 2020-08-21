import 'package:flutter/material.dart';
import 'package:tt_book/customView/hrbottombar/HrBottomBarMain.dart';

class HrBottomBarModel extends StatefulWidget {
  final bool isHrBottomBar;
  final IconData icon;
  final String text;
  final void Function() onPerson;

  const HrBottomBarModel(
      {Key key,
      @required this.isHrBottomBar,
      @required this.icon,
      @required this.text,
      this.onPerson})
      : super(key: key);

  @override
  _HrBottomBarModelState createState() => _HrBottomBarModelState();
}

class _HrBottomBarModelState extends State<HrBottomBarModel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPerson,
      child: widget.isHrBottomBar
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.7),
                borderRadius: BorderRadius.circular(52),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    widget.icon,
                    color: Colors.deepOrange,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          : Icon(widget.icon),
    );
  }
}
