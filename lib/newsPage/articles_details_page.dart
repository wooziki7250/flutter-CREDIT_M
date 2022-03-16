import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_team4_app/newsPage/model/article_model.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  final Article? article;
  ArticlePage({Key? key, this.article}) : super(key: key);

  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();

  bool isLoding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xffedf2fb),
        elevation: 0, // appbar 밑에 그림자 제거
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // WebView(
          //   initialUrl: article!.url,
          //   javascriptMode: JavascriptMode.unrestricted,
          //   onWebViewCreated: (WebViewController webViewController) {
          //     _controller.complete(webViewController);
          //   },
          // )
        ],
      ),
    );
  }
}
