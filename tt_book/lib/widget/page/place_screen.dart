import 'package:flutter/material.dart';
import 'package:tt_book/models/place_model.dart';

class PlaceScreen extends StatefulWidget {
  final Place place;

  const PlaceScreen({Key key, this.place}) : super(key: key);

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                    tag: widget.place.imageUrl,
                    child: Container(
                      width: double.infinity,
                      height: 600.0,
                      decoration: BoxDecoration(
                          color: Color(0xffE5f2ff),
                          image: DecorationImage(
                              image: AssetImage(widget.place.imageUrl))),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.subdirectory_arrow_left),
                          onPressed: () => Navigator.pop(context)),
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () => Navigator.pop(context)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 400.0,
              width: double.infinity,
              transform: Matrix4.translationValues(0, -50, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.place.city},${(widget).place.country}",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.event,
                          size: 60,
                          color: Colors.black,
                        ),
                        Column(
                          children: <Widget>[

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
