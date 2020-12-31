import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LoadState {
  LOADING,
  ERROR,
  EMPTY,
  NORMAL,
}

class StateContainerPage extends StatefulWidget {
  final Widget child;
  final LoadState loadState;
  final Function onErrorClick;

  const StateContainerPage(
      {Key key,
      this.loadState = LoadState.NORMAL,
      this.onErrorClick,
      @required this.child})
      : super(key: key);

  @override
  _StateContainerPageState createState() => _StateContainerPageState();
}

class _StateContainerPageState extends State<StateContainerPage> {
  @override
  Widget build(BuildContext context) {
    return _notifiState(widget.loadState);
  }

  Widget _notifiState(LoadState stateType) {
    switch (stateType) {
      case LoadState.LOADING:
        return _loadingView();
        break;
      case LoadState.EMPTY:
        return _emptyView();
        break;
      case LoadState.NORMAL:
        return _normalView();
        break;
      case LoadState.ERROR:
        return _errorView();
        break;
    }
  }

  Widget _errorView() {
    return Container(
      child: Text('错误页面'),
    );
  }

  Widget _emptyView() {
    return Container(
      child: Text('空白页面'),
    );
  }

  Widget _normalView() {
    return widget.child;
  }

  Widget _loadingView() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: 1.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: SpinKitCircle(color: Colors.red)),
          Container(height: 10.0),
          Container(
              child: new Text(
            '加载中',
          )),
        ],
      ),
    );
  }
}
