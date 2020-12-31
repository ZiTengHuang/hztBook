import 'package:flutter/material.dart';
import 'package:tt_book/common/refresh/pullRefreshState.dart';
import 'package:tt_book/common/refresh/state/state_container_page.dart';

import 'SampleListItem.dart';

abstract class BaseRequestContainer<T extends StatefulWidget, R, D>
    extends State<T>
    with AutomaticKeepAliveClientMixin
    implements IPullToRefresh {
  PullLoadController<D> pullLoadController;
  @protected
  int pageNo = 1;

  int pageSize = 999;
  bool isLoadAll = false;
  LoadState _loadState = LoadState.LOADING;

  @protected
  PullLoadController getPullLoadController() {
    return pullLoadController;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pullLoadController = pullLoadController ?? PullLoadController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  ///请求数据
  @protected
  request(bool refresh) async {
    /// 如果不是第一次刷新
    if (!pullLoadController.isOnRequest) {
      /// 如果是刷新
      if (!refresh) {
        pageNo = 1;
        _loadState = LoadState.LOADING;

        print('显示loading');

      }

      pullLoadController.isOnRequest = true;
      print('============1');
      Future future = requestFuture();
      print('============2');
      if (null == future) {
        /// 显示空白页面
        print('显示空白页面');
        Future.delayed(new Duration(milliseconds: 1000),(){
            setState(() {
              _loadState = LoadState.EMPTY;

            });
        });
        return null;
      }
      return future.then((value) {
        print('🔨 1111111');
        pullLoadController.isOnRequest = false;
        if (!refresh) {
          ///切换成正常界面
            _loadState = LoadState.NORMAL;
        }
        if (mounted) {
          setState(() {
            if (pageNo == 1) {
              pullLoadController.dataList.clear();
            }

            ///更新数据源
            int count = pullLoadController.dataList.length;
            updateDateSet(value);

            /// 是否最后一次获取到的数据大于了设置
            pullLoadController.enablePullUp =
                pullLoadController.dataList.length > count;
            if (pageNo > 1 && !pullLoadController.enablePullUp) {
              print('没有更多数据');
            }
            pageNo++;
          });
        }
        if (pullLoadController.dataList.isEmpty) {
          if (!refresh) {
            ///设置为空界面
            print('空界面');
          }
        }
      }).catchError((error) {
        print('error:$error');
        pullLoadController.isOnRequest = false;
        if (!refresh) {}
      });
    }
  }

  @protected
  buildRefreshContainer() {
    return Stack(
      children: <Widget>[
        Container(
          child: StateContainerPage(
            loadState: _loadState,
            onErrorClick: () {
              request(false);
            },
            child: PullRefreshState(
              vsync: this,
            ),
          ),
        ),
      ],
    );
  }

  @protected
  requestFuture() {
    return null;
  }

  @protected
  updateDateSet(R value) {}

  @override
  Widget refreshChild() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return SampleListItem();
    }, childCount: 10));
  }

  @override
  Future refreshCallBack() {
    pageNo = 1;
    return request(true);
  }

  @override
  Future loadMoreCallBack() {
    return request(true);
  }
}

///刷新控制器
class PullLoadController<T> {
  List<T> dataList = new List<T>();

  bool enablePullUp = true;

  bool isOnRequest = false;
}
