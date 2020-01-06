import 'package:flutter/material.dart';
import 'package:flutter_app_loan/models/web_model_entity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageCustom extends StatefulWidget {
  @override
  _WebViewPageCustomState createState() => _WebViewPageCustomState();
}

class _WebViewPageCustomState extends State<WebViewPageCustom> {
  @override
  Widget build(BuildContext context) {
    WebModelEntity model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          model.title,
        ),
      ),
      body: WebView(
        initialUrl: model.url, // 加载的url
        onWebViewCreated: (WebViewController web) {
          // webview 创建调用，
          web.loadUrl(model.url);
          web.canGoBack().then((res) {
//            print(res); // 是否能返回上一级
          });
          web.currentUrl().then((url) {
//            print(url); // 返回当前url
          });
          web.canGoForward().then((res) {
//            print(res); //是否能前进
          });
        },
        onPageFinished: (String value) {
          // webview 页面加载调用
        },
      ),
    );
  }
}
