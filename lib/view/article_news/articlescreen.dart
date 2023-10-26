import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key, required this.blogUrl});

  final String blogUrl;

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text.rich(TextSpan(children: <InlineSpan>[
          TextSpan(
            text: 'Flutter ',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: 'News',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          )
        ])),
      ),
      body: Container(
        child: WebView(
          initialUrl: blogUrl,
          onWebViewCreated: (controller) {
            _completer.complete(controller);
          },
        ),
      ),
    );
  }
}
