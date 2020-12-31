import 'package:flutter/material.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';

class GetMainPage extends StatefulWidget {
  @override
  _GetMainPageState createState() => _GetMainPageState();
}

class _GetMainPageState extends State<GetMainPage> {
  List<Widget> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(context: context, title: 'GetX的世界'),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context,index){
                    return _buildGetXItem(index);
                  },itemCount: _items.length,))
        ],
      ),
    );
  }


  _buildGetXItem(int index) {
    Card item = Card(
         
    );
  }
}
