import 'package:flutter/material.dart';
import 'package:tt_book/costom/WebTermsOfServicePage.dart';
import 'package:tt_book/dao/search_dao.dart';
import 'package:tt_book/models/search_model.dart';
import 'package:tt_book/widget/search/search_demo.dart';

const URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';
const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

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
                  SearchDao.fetch(URL, _keyWork).then((SearchModel value) {
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
    _keyWork = value;
    int valueLength = value.length;
    if (valueLength == 0) {
      setState(() {
        _searchModel = null;
      });
      return;
    }
    String url = URL + value;
    SearchDao.fetch(url, _keyWork).then((SearchModel covariant) {
      if (covariant.keyWork == _keyWork) {
        setState(() {
          _searchModel = covariant;
        });
      }
    }).catchError((e) {
      print(e);
      print(url);
    });
  }

  Widget _searchItemWidget(int index) {
    if (_searchModel == null || _searchModel.data == null) return null;
    SearchItem item = _searchModel.data[index];
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1),
              child: Image(
                  height: 26,
                  width: 26,
                  image: AssetImage(_typeImage(item.type))),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: _title(item),
                ),
                Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 5),
                    child: _subTitle(item))
              ],
            )
          ],
        ));
  }

  _typeImage(String type) {
    if (type == null) return 'assets/images/type_travelgroup.png';
    String path = 'travelgroup';

    for (final val in TYPES) {
      if (val.contains(type)) {
        path = val;
        break;
      }
    }
    return 'assets/images/type_$path.png';
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: item.price ?? '',
            style: TextStyle(fontSize: 16, color: Colors.grey)),
        TextSpan(
          text: ' ' + (item.star ?? ''),
          style: TextStyle(fontSize:  12,color: Colors.orange),
        )
      ]),
    );
  }

  _title(SearchItem item) {
    if (item == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, _searchModel.keyWork));
    spans.add(TextSpan(
        text: ' ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(text: TextSpan(children: spans));
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    print(word);
    print(keyword);
    if (word == null || word.length == 0) return spans;
    //搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);
    //'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        //搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle));
      }
      String val = arr[i];
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
