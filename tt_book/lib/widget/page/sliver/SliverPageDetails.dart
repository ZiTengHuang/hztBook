import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/models/post.dart';

///个人详情页面
class SliverPageDetails extends StatefulWidget {
  @override
  _SliverPageDetailsState createState() => _SliverPageDetailsState();
}

class _SliverPageDetailsState extends State<SliverPageDetails>
    with TickerProviderStateMixin {
  ///滑动的距离
  double extraPicHeight = 0;

  double prey_dy = 0;
  AnimationController _animationController;
  Animation _animation;
  BoxFit fitType;
  double rpx = 0;
  double topbarHeight = 300;

  updateHeight(double height) {
    setState(() {
      topbarHeight = height;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fitType = BoxFit.fitWidth;
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 0.0).animate(_animationController);
  }

  ///计算图片在我手指滑动中 增加了多少！
  updatePicHeight(changed) {
    if (prey_dy == 0) {
      prey_dy = changed;
    }
    extraPicHeight += changed - prey_dy;
    if (extraPicHeight > 300 * rpx) {
      fitType = BoxFit.fitHeight;
    } else {
      fitType = BoxFit.fitWidth;
    }
    setState(() {
      fitType = fitType;
      prey_dy = changed;
      extraPicHeight = extraPicHeight;
    });
  }

  ///手指抬起执行动画
  runAnimation() {
    _animation =
        Tween(begin: extraPicHeight, end: 0.0).animate(_animationController)
          ..addListener(() {
            if (extraPicHeight > 300 * rpx) {
              fitType = BoxFit.fitHeight;
            } else {
              fitType = BoxFit.fitWidth;
            }

            setState(() {
              extraPicHeight = _animation.value;
              fitType = fitType;
            });
          });
    prey_dy = 0;
  }

  @override
  Widget build(BuildContext context) {
    rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      body: Listener(
        onPointerMove: (result) {
          updatePicHeight(result.position.dy);
        },
        onPointerUp: (_) {
          runAnimation();
          _animationController.forward(from: 0);
        },
        child: Theme(
            data: ThemeData(primaryColor: Colors.blue),
            child: CustomScrollView(
              ///可以禁止ios 的回弹效果
              physics: ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  leading: IconButton(
                      icon: Icon(CupertinoIcons.left_chevron),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  expandedHeight: topbarHeight+extraPicHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background:  TopBarWaitCallback(
                      extraPicHeight: extraPicHeight,
                      boxType: fitType,
                      updateHeight: updateHeight,
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.red,
                  );
                }, childCount: 30)),
              ],
            )),
      ),
    );
  }
}

class TopBarWaitCallback extends StatefulWidget {
  final double extraPicHeight;
  final BoxFit boxType;
  final Function updateHeight;

  const TopBarWaitCallback(
      {Key key, this.extraPicHeight, this.boxType, this.updateHeight})
      : super(key: key);

  @override
  _TopBarWaitCallbackState createState() => _TopBarWaitCallbackState();
}

class _TopBarWaitCallbackState extends State<TopBarWaitCallback>
    with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverTopBar(
        extraPicHeight: widget.extraPicHeight,
        boxType: widget.boxType,
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    ///在组件渲染完成后动态的拿到组件的高度
    ///2行注释的代码是可以拿到当前被render出来的组件高度，但是被超出的高度是拿不到的
//    RenderBox rb = context.findRenderObject();
//    Size size = rb.size;
    RenderBox rb = context.findRenderObject();
    double hei = rb.getMaxIntrinsicHeight(MediaQuery.of(context).size.width);
    widget.updateHeight(hei);
  }
}

class SliverTopBar extends StatelessWidget {
  final double extraPicHeight;
  final BoxFit boxType;

  const SliverTopBar(
      {Key key, @required this.extraPicHeight, @required this.boxType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/bangkok.png',
              width: 750 * rpx,
              height: 300 * rpx + extraPicHeight,
              fit: boxType,
            ),
            Container(
              height: 100 * rpx,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 330 * rpx,
                    height: 70 * rpx,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('+ 关注'),
                    ),
                  ),
                  SizedBox(
                    width: 20 * rpx,
                  ),
                  Container(
                    color: Colors.grey,
                    width: 70 * rpx,
                    height: 70 * rpx,
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  SizedBox(
                    width: 20 * rpx,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20 * rpx),
              alignment: Alignment(-1, 0),
              height: 100 * rpx,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('逼王之王',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),        Container(
              margin: EdgeInsets.only(top: 10, left: 20 * rpx),
              alignment: Alignment(-1, 0),
              height: 100 * rpx,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('逼王之王',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),        Container(
              margin: EdgeInsets.only(top: 10, left: 20 * rpx),
              alignment: Alignment(-1, 0),
              height: 100 * rpx,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('逼王之王',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        Positioned(
            top: 240 * rpx + extraPicHeight,
            left: 30 * rpx,
            child: Container(
              height: 180 * rpx,
              width: 180 * rpx,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://resources.ninghao.org/images/candy-shop.jpg'),
              ),
            ))
      ],
    );
  }
}
