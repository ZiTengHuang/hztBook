import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tt_book/models/post.dart';

class FrostedGlassDemo extends StatefulWidget {
  @override
  _FrostedGlassDemoState createState() => _FrostedGlassDemoState();
}

class _FrostedGlassDemoState extends State<FrostedGlassDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(posts[1].imageUrl),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Opacity(
              opacity: 0.2,
              child: Container(
                height: 500,
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
