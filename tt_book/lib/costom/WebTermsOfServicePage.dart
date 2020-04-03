import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebTermsOfServicePage extends StatefulWidget {
  final String title;
  final String url;

  const WebTermsOfServicePage({Key key, this.title, this.url})
      : super(key: key);

  @override
  _WebTermsOfServicePageState createState() => _WebTermsOfServicePageState();
}

class _WebTermsOfServicePageState extends State<WebTermsOfServicePage> {
  final webviewReference = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: ()=>Navigator.pop(context)),
      ),
      hidden: true,
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
