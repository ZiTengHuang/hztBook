import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerLayout extends StatefulWidget {
  @override
  _BannerLayoutState createState() => _BannerLayoutState();
}

class _BannerLayoutState extends State<BannerLayout> {

  final  _imgUrl = [
     'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1573807442&di=6baa750816f42a4f88d1ffd57790ca28&src=http://www.dabaoku.com/sucaidatu/zhonghua/fengjingyouhua/401240.jpg',
     'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573817525636&di=5b193f721f0654969f1f1c5e8b25b966&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F31%2F29%2F94bOOOPIC15_1024.jpg',
     'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573817525636&di=24e1601f1929152a9e18facbeb9fcbdb&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F01%2F11%2F30%2F48b1OOOPIC32.jpg',
     'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573817525636&di=6515e0d50f1eed48f1f98d3320122d14&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F11%2F12%2F38%2F68b1OOOPIC2f.jpg',
     'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573823646303&di=b1e31c7d5085dbfa586b82dd0d82138c&imgtype=0&src=http%3A%2F%2Fimg02.tooopen.com%2Fimages%2F20131206%2Fsy_50387022242.jpg',
     'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573823646302&di=5eba3aad3820a883284d7e58af326b40&imgtype=0&src=http%3A%2F%2Ffile2.gucn.com%2Ffile%2FCurioPicfile%2F201008%2FGucn_20100826149527120643Pic2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: Swiper(

        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: new Image.network(
              _imgUrl[index],
              fit: BoxFit.fill,
            ), 
          );
        },
        autoplay: true,
        itemCount: _imgUrl.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
