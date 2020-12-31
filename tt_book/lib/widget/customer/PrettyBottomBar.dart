import 'package:flutter/material.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';

class PrettyBottomBar extends StatefulWidget {
  @override
  _PrettyBottomBarState createState() => _PrettyBottomBarState();
}

enum PrettyBottomBarEnum {
  HOME,
  PERSON,
  MESSAGE,
}

class _PrettyBottomBarState extends State<PrettyBottomBar> {
  PrettyBottomBarEnum prettyBottomBarEnum = PrettyBottomBarEnum.HOME;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(context: context, title: '漂亮的底部bar'),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
                color: Color(0xfff7f7f7),
              ),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PrettyBottomBarClass(
                    onPressed: () {
                      setState(() {
                        prettyBottomBarEnum = PrettyBottomBarEnum.HOME;
                      });
                    },
                    isCurrent: prettyBottomBarEnum == PrettyBottomBarEnum.HOME
                        ? true
                        : false,
                    text: 'Home',
                    icons: Icons.home,
                  ),
                  PrettyBottomBarClass(
                    onPressed: () {
                      setState(() {
                        prettyBottomBarEnum = PrettyBottomBarEnum.MESSAGE;
                      });
                    },
                    isCurrent:
                        prettyBottomBarEnum == PrettyBottomBarEnum.MESSAGE
                            ? true
                            : false,
                    text: 'MESSAGE',
                    icons: Icons.message,
                  ),
                  PrettyBottomBarClass(
                    onPressed: () {
                      setState(() {
                        prettyBottomBarEnum = PrettyBottomBarEnum.PERSON;
                      });
                    },
                    isCurrent: prettyBottomBarEnum == PrettyBottomBarEnum.PERSON
                        ? true
                        : false,
                    text: 'PERSON',
                    icons: Icons.person,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PrettyBottomBarClass extends StatefulWidget {
  final Function onPressed;
  final bool isCurrent;
  final String text;
  final IconData icons;

  const PrettyBottomBarClass(
      {Key key, this.onPressed, this.isCurrent, this.text, this.icons})
      : super(key: key);

  @override
  _PrettyBottomBarClassState createState() => _PrettyBottomBarClassState();
}

class _PrettyBottomBarClassState extends State<PrettyBottomBarClass> {
  @override
  Widget build(BuildContext context) {
    print(widget.isCurrent);
    return widget.isCurrent == true
        ? Container(
            width: 120,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(33),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  widget.text,
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  widget.icons,
                  color: Colors.white,
                ),
              ],
            ),
          )
        : IconButton(
            icon: Icon(widget.icons),
            onPressed: () {
              widget.onPressed();
            });
  }
}
