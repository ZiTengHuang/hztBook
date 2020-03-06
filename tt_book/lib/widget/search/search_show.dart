import 'package:flutter/material.dart';
import 'package:tt_book/dao/search_dao.dart';
import 'package:tt_book/models/search_model.dart';
import 'package:tt_book/widget/search/search_demo.dart';

const URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchShow extends StatefulWidget {
  final String keyword;

  final String hint;
  final bool hideLeftArrow;

  final String searchUrl;

  const SearchShow(
      {Key key,
      this.keyword = '北京',
      this.hint,
      this.hideLeftArrow,
      this.searchUrl})
      : super(key: key);

  @override
  _SearchShowState createState() => _SearchShowState();
}

class _SearchShowState extends State<SearchShow> {
  SearchModel _searchModel;

  String _keyWork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x60000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Container(
              height: 80,
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: SearchBar(
                hideLeft: widget.hideLeftArrow,
                leftButtonClick: () {
                  Navigator.pop(context);
                },
                defaultText: widget.keyword,
                hint: widget.hint,
                onChanged: _onTextChanged,
                rightButtonClick: () {
                  SearchDao.fetch(URL).then((SearchModel value) {
                    print(value.data[0].url);
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xfff7f7f7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemBuilder: (_, index) {
                return _searchItemWidget(index);
              },
              itemCount: _searchModel?.data?.length ?? 0,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SearchBar(
            hideLeft: false,
            searchBarType: SearchBarType.home,
            leftButtonClick: () {},
            defaultText: '首页样式',
            hint: '3232',
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }
  void _onChanged(String value) {}
  //
  void _onTextChanged(String value) {
    int valueLength = value.length;
    if (valueLength == 0) {
      setState(() {
        _searchModel = null;
      });
      return;
    }
    String url = URL + value;
    SearchDao.fetch(url).then((SearchModel covariant) {
      setState(() {
        _searchModel = covariant;
      });
    }).catchError((e) {
      print(e);
      print(url);

    });
  }

  Widget _searchItemWidget(int index) {
    if (_searchModel == null || _searchModel.data == null) return null;
    SearchItem item = _searchModel.data[index];
    return ListTile(
      title: Text(item.word),
    );
  }
}
