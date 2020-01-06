import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '关于我们',
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: G_width(20), right: G_width(20), top: G_height(5)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: G_height(10)),
              child: Image(
                image: AssetImage("images/ins_help_you_nan.png"),
                width: G_width(60),
                height: G_width(60),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: G_height(10)),
              child: Text('版本：1.0'),
            ),
            Container(
              margin: EdgeInsets.only(top: G_height(10)),
              child: Text(
                '为了满足大家开发小程序等需求，目前本站完全迁移到https下，如果你是开源项目开发者，请尽快迁移 base url 为 https。',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
