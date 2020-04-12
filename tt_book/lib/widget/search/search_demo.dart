import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint; //默认提示文案
  final String defaultText;
  final void Function() leftButtonClick; //左边按钮点击回掉
  final void Function() rightButtonClick; //
  final void Function() speakClick; // 语音按钮的按钮
  final void Function() inputBoxClick; //输入框的click
  final ValueChanged<String> onChanged; //文字变化的回掉

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.defaultText != null) {
      setState(() {
        _textEditingController.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _genNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
            child: _wrapTap(
                widget?.hideLeft ?? false
                    ? SizedBox()
                    : Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                        size: 26,
                      ),
                widget.leftButtonClick),
          ),
          Expanded(child: _inputBox()),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  _genHomeSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 5, 5, 5),
            child: _wrapTap(
                widget?.hideLeft ?? false
                    ? SizedBox()
                    : Row(
                        children: <Widget>[
                          Text(
                            '上海',
                            style: TextStyle(
                              color: _homeFontColor(),
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                            color: _homeFontColor(),
                            size: 22,
                          ),
                        ],
                      ),
                widget.leftButtonClick),
          ),
          Expanded(child: _inputBox()),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                child: Icon(
                  Icons.message,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
      child: child,
    );
  }

  _inputBox() {
    Color inputBoxBackdropColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxBackdropColor = Colors.blueGrey;
    } else {
      inputBoxBackdropColor = Color(0xffededed);
    }
    return Container(
      height: 35,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxBackdropColor,
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.normal ? 5 : 25)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffa9a9a9)
                : Colors.blue,
          ),
          Expanded(
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                      controller: _textEditingController,
                      onChanged: _onChanged,
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        hintText: widget.hint ?? '',
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )
                  : _wrapTap(
                      Container(
                        child: Text(
                          widget.defaultText,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick)),
          showClear
              ? _wrapTap(
                  Icon(
                    CupertinoIcons.clear,
                    size: 26,
                  ), () {
                  setState(() {
                    showClear = false;
                    widget.onChanged('');
                    _textEditingController.clear();
                  });
                })
              : _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  widget.speakClick)
        ],
      ),
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }


  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black45
        : Colors.blueGrey;
  }
}
