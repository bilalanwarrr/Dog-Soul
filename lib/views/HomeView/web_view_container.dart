import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late final WebViewController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WebViewCookieManager().setCookie(WebViewCookie(
    //     name: "bot_id",
    //     value: "ebcb996e120b4cae",
    //     domain: "https://www.chatnode.ai/embed/ebcb996e120b4cae"));

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse("https://www.chatnode.ai/embed/ebcb996e120b4cae"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebViewWidget(
              controller: _controller,
            ))
          ],
        ));
  }
}
