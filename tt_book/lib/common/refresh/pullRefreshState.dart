import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:tt_book/common/refresh/SampleListItem.dart';

class PullRefreshState<T> extends StatefulWidget {
  final IPullToRefresh<T> vsync;

  PullRefreshState({this.vsync});

  @override
  _PullRefreshStateState createState() => _PullRefreshStateState();
}

class _PullRefreshStateState extends State<PullRefreshState> {
  int _count = 20;

  GlobalKey _easyKey = new GlobalKey();
  GlobalKey _headerKey = new GlobalKey();
  GlobalKey _footerKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
        key: _easyKey,
        header: BezierCircleHeader(key: _headerKey),
        footer: BezierBounceFooter(key: _footerKey),
        onRefresh: () {
          _onRefresh(true);
        },
        onLoad: () {
          _onRefresh(false);
        },
        slivers: <Widget>[
          widget.vsync?.refreshChild() ??
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return SampleListItem();
              }, childCount: _count)),
        ]);
  }

  _onRefresh(bool up) {
    if (up) {
      widget.vsync.refreshCallBack();
    } else {
      widget.vsync.loadMoreCallBack();
    }
  }
}

abstract class IPullToRefresh<T> {
  @protected
  Widget refreshChild();

  @protected
  Future<T> refreshCallBack();

  @protected
  Future<T> loadMoreCallBack();
}
