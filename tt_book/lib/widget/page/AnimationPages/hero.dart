import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:tt_book/models/post.dart'; //使用这个函数 。能控制hero动画的速度
import 'dart:math' as math;

///  hero 是必须两端都实现的timeDilation 是控制hero 动画的速度。
class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: PhotoHero(
                  photo: posts[0].imageUrl,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.pinkAccent,
                          title: Text('hero动画'),
                        ),
                        body: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 300,
                              width: 300,
                              child: Hero(
                                  tag: posts[0].imageUrl,
                                  child: Image.network(
                                    posts[0].imageUrl,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      );
                    }));
                  },
                  width: 300,
                ),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: RadialExpansionDemo(),
            ),
          )),
        ],
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  final String photo;

  final VoidCallback onTap;

  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}

class Photo extends StatelessWidget {
  final String photo;

  final VoidCallback onTap;

  final double width;

  const Photo({Key key, this.photo, this.onTap, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(

      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, size) {
            return Image.network(
              photo,
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadial;
  final ClipRectSize;

  final Widget child;

  const RadialExpansion({Key key, this.maxRadial, this.child})
      : ClipRectSize = 2.0 * (maxRadial / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipOval(
      child: Center(
        child: SizedBox(
          height: ClipRectSize,
          width: ClipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 108.0;
  static const opcatityCurve =
      const Interval(0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Scaffold(
      appBar: AppBar(

          title: Text('sdf'),
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: Center(
          child: Card(

            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: kMaxRadius * 2,
                    height: kMaxRadius * 2,
                    child: Hero(
                        tag: imageName,
                        createRectTween: _createRectTween,
                        child: RadialExpansion(
                          maxRadial: kMaxRadius,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Photo(
                              photo: imageName,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        )),
                  ),
                  Text(description),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
        tag: imageName,
        child: RadialExpansion(
          maxRadial: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
//                Navigator.of(context).push(MaterialPageRoute(builder: (context){
//                      return _buildPage(context, imageName, description);
//                }));
              Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: opcatityCurve.transform(animation.value),
                      child: _buildPage(context, imageName, description),
                    );
                  },
                );
              }));
            },
          ),
        ),
        createRectTween: _createRectTween,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildHero(context, posts[1].imageUrl, posts[1].title),
        _buildHero(context, posts[2].imageUrl, posts[2].title),
        _buildHero(context, posts[3].imageUrl, posts[3].title),
        _buildHero(context, posts[4].imageUrl, posts[4].title),
      ],
    );
  }
}
