import 'package:flutter/material.dart';
import 'package:tt_book/models/post.dart';

class OnboardingsStyleOne extends StatefulWidget {
  @override
  _OnboardingsStyleOneState createState() => _OnboardingsStyleOneState();
}

class _OnboardingsStyleOneState extends State<OnboardingsStyleOne> {
  int totalPages = 3;

  final PageController _pageController = new PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => _jumpPage(index),
          children: <Widget>[
            _buildPageContent(0),
            _buildPageContent(1),
            _buildPageContent(2),

          ],
        ),
        bottomSheet: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(onPressed: () {
//                _jumpPage(_currentPage - 1);
                _pageController.animateToPage(
                    _currentPage -1, duration: new Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {
                  _currentPage -1;
                });
              }, child: Text('SkIP')),
              Row(children: <Widget>[
                for(int i = 0; i < totalPages; i++ )
                  i == _currentPage
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false),

              ],),
              FlatButton(onPressed: () {
//                _jumpPage(_currentPage - 1);
                _pageController.animateToPage(
                    _currentPage +1, duration: new Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {
                  _currentPage +1;
                });              }, child: Text('NIXT'))
            ],
          ),
        ),
      ),
    );
  }

  _jumpPage(int index) {
    _pageController.jumpToPage(index);
    _currentPage = index;
    setState(() {

    });
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  _buildPageContent(index) {
    return Container(
      height: 300,
      width: 300,
      child: Image.network(
        posts[index].imageUrl,
      ),
    );
  }
}
