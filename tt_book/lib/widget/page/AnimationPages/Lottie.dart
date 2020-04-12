import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

class Lottie extends StatefulWidget {
  @override
  _LottieState createState() => _LottieState();
}

class _LottieState extends State<Lottie> {
  LottieController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Container(
                height: 40,
                width: 40,
                child: LottieView.fromFile(
                  onViewCreated: (e) {},
                  filePath: "assets/images/lottie.json",
                  autoPlay: true,
                  loop: true,
                  reverse: false,
                ),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/109-bouncy-loader.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
            Container(
              height: 300,
              width: 300,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/142-loading-animation.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
            Container(
              height: 120,
              width: 120,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/201-simple-loader.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/1049-hourglass.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/17433-lucky-drawred-packet-btn.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
            Stack(
              alignment: Alignment(0,0),
              children: <Widget>[

                Container(
                  height: 200,
                  width: 200,
                  child: LottieView.fromFile(
                    onViewCreated: (e) {},
                    filePath: "assets/images/2853-circle-red-button.json",
                    autoPlay: true,
                    loop: true,
                    reverse: true,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('点击抽奖'),
                )
              ],
             ),

            Container(
              height: 300,
              width: double.maxFinite,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white

              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: double.infinity,
                    child: LottieView.fromFile(
                      onViewCreated: (e) {},
                      filePath: "assets/images/lf30_editor_Fn31Jf.json",
                      autoPlay: true,
                      loop: true,
                      reverse: true,
                    ),
                  )   ,


                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 140,
              width: double.infinity,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/lf30_editor_8n16I8.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.bottomCenter,
              height: 140,
              width: double.infinity,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/lf30_editor_JNu6oh.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),   SizedBox(height: 50,),
            Container(
              alignment: Alignment.bottomCenter,
              height: 140,
              width: double.infinity,
              child: LottieView.fromFile(
                onViewCreated: (e) {},
                filePath: "assets/images/lf30_editor_U5Fx0f.json",
                autoPlay: true,
                loop: true,
                reverse: true,
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onViewCreated(LottieController controller) {
    this.controller = controller;

    // Listen for when the playback completes
    this.controller.onPlayFinished.listen((bool animationFinished) {
      print("Playback complete. Was Animation Finished? " +
          animationFinished.toString());
    });
  }
}
