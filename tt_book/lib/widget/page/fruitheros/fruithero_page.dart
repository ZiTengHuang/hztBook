import 'package:flutter/material.dart';

class FruitheroPage extends StatefulWidget {
  @override
  _FruitheroPageState createState() => _FruitheroPageState();
}

class _FruitheroPageState extends State<FruitheroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21bfbd),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 0, right: 20, left: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          icon: Icon(Icons.chevron_left), onPressed: ()=> Navigator.pop(context)),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.add_comment), onPressed: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(icon: Icon(Icons.announcement), onPressed: () {}),
                ],
              )),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Row(
              children: <Widget>[
                Text(
                  'sdfadf',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'sdfadf',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 20, right: 25),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 350,
                    child: ListView(
                      children: <Widget>[
                        _buildFoodItem(
                            'assets/images/plate1.png', 'Smal ??', '¥44'),
                        _buildFoodItem(
                            'assets/images/plate2.png', 'Smal ??', '¥44'),
                        _buildFoodItem(
                            'assets/images/plate3.png', 'Smal ??', '¥44'),
                        _buildFoodItem(
                            'assets/images/plate4.png', 'Smal ??', '¥44'),
                        _buildFoodItem(
                            'assets/images/plate5.png', 'Smal ??', '¥44'),
                        _buildFoodItem(
                            'assets/images/plate6.png', 'Smal ??', '¥44'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 50),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.perm_scan_wifi,
                          color: Colors.black26,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.black26,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Hero(
              tag: imgPath,
              child: Image(
                image: AssetImage(imgPath),
                fit: BoxFit.contain,
                width: 75,
                height: 75,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(child: Text('')),
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
