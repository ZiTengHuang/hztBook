import 'package:flutter/material.dart';
import 'package:tt_book/common/refresh/BaseRequestContainer.dart';
import 'package:tt_book/common/refresh/InviteListInfo.dart';

class PackRefresh extends StatefulWidget {
  @override
  _PackRefreshState createState() => _PackRefreshState();
}

class _PackRefreshState
    extends BaseRequestContainer<PackRefresh, InviteListInfo, InviteInfo> {
  List<InviteInfo> invites = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    request(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通用刷新测试'),
      ),
      body: buildRefreshContainer(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  requestFuture() {
    // TODO: implement requestFuture
    return null;

  }
}
