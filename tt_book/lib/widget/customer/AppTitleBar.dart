import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar AppTitleBar({
  @required BuildContext context,
  @required title,
  Color lardingColor,
  Color titleColor,
  Color backgroundColor,
  List<Widget> actions,
  PreferredSizeWidget bottom,
  VoidCallback leftCallBack,
  bool centTitle = false,
}) {
  Widget _title;
  if (title is Widget) {
    _title = title;
  } else if (title is String) {
    _title = IgnorePointer(
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  final route = ModalRoute.of(context);
  var btnBack, titleSpacing;

  ///判断是否弹出此路由
  if (route.canPop) {
    btnBack = IconButton(
        iconSize: 28,
        padding: EdgeInsets.zero,
        icon: Icon(
          CupertinoIcons.left_chevron,
          color: lardingColor,
        ),
        onPressed: () =>
            leftCallBack == null ? Navigator.maybePop(context) : leftCallBack);
  }
  final AppBarTheme appBarTheme = AppBarTheme.of(context);

  titleSpacing = -(kToolbarHeight * 0.24);

  final appbar = AppBar(
    backgroundColor: backgroundColor ?? appBarTheme.color,
    leading: btnBack,
    actions: actions,
    bottom: bottom,
    title: _title,
    titleSpacing: titleSpacing,
    centerTitle: centTitle,
    elevation: 0,

  );
  return appbar;
}
