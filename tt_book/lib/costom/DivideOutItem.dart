import 'package:flutter/material.dart';
import 'package:tt_book/common/NumberUtils.dart';

class DivideOutItem extends StatefulWidget {
  final double min;
  final double max;
  final String hintText;
  String number = "0.0";
  double step = 0.1; //增减数
  int numberLength = 1; //位数
  Widget cutWidget;
  Widget addWidget;
  final TextStyle style;

  final ValueChanged<String> onChanged;

  DivideOutItem({
    Key key,
    this.min,
    this.max,
    this.onChanged,
    this.hintText,
    String number,
    double step,
    int numberLength,
    TextEditingController inputController,
    Widget cutWidget,
    Widget addWidget,
    TextStyle style,
  })  : number = number ?? "0.0",
        step = step ?? 0.1,
        numberLength = numberLength ?? 1,
        style = style ?? TextStyle(fontSize: 14, color: Colors.deepOrange),
        cutWidget = cutWidget ??
            Icon(
              Icons.add,
              size: 22,
            ),
        addWidget = addWidget ??
            Icon(
              Icons.remove,
              size: 22,
            ),
        super(key: key);

  @override
  _DivideOutItemState createState() => _DivideOutItemState();
}

class _DivideOutItemState extends State<DivideOutItem> {
  String numberStr;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //检查输入
  changeNumber(bool isAdd) {
    double number = double.parse(widget.number);
    if (isAdd) {
      if (number < widget.max) {
        numberStr =
            NumberUtils.getDouble(number + widget.step, widget.numberLength)
                .toString();
      } else {}
    } else {
      if (number > widget.min) {
        numberStr =
            NumberUtils.getDouble(number - widget.step, widget.numberLength)
                .toString();
      }
    }
    if (widget.onChanged != null) {
      widget.onChanged(numberStr);
    }
  }

  @override
  Widget build(BuildContext context) {
    numberStr = widget.number;
    return Container(
//      margin: EdgeInsets.symmetric(horizontal: Demins.margin_h),
      height: 40.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              changeNumber(false);
            },
            child: widget.cutWidget,
          ),
          Expanded(
            child: Center(
              child: Container(
                child: Center(
                  child: Text(
                    numberStr,
                    style: TextStyle(fontSize: 14, color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              changeNumber(true);
            },
            child: widget.addWidget,
          ),
        ],
      ),
    );
  }
}
