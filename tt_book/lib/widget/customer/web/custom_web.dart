import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWeb extends StatefulWidget {
  final String url;
  final String title;

  const CustomWeb({Key key, @required this.url, @required this.title})
      : super(key: key);

  @override
  _CustomWebState createState() => _CustomWebState();
}

class _CustomWebState extends State<CustomWeb> {
  double webProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.clear), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: <Widget>[
          webProgress != 1
              ? LinearProgressIndicator(
                  value: webProgress,
                )
              : SizedBox(),
          Expanded(
            flex: 1,
            child: InAppWebView(
              initialOptions: InAppWebViewWidgetOptions(
                iosInAppWebViewOptions:
                    IosInAppWebViewOptions(disallowOverScroll: true),
              ),
              initialUrl: widget.url,
              onProgressChanged: (controller, int progress) {
                setState(() {
                  this.webProgress = progress / 100;
//                  print(webProgress);

                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
