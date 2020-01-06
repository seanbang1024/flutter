import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';
import 'package:flutter_app_loan/commons/Global.dart';
import 'dart:convert' as convert;

import 'package:flutter_app_loan/models/user_login_entityX.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    String json = SharedPreferencesUtil.preferences.getString('LoginInfo');
    Map<String, dynamic> user = convert.jsonDecode(json);
    UserLoginEntity userLoginEntity = UserLoginEntity.fromJson(user);

    return Scaffold(
      backgroundColor: Colors.white,
//        appBar: AppBar(
//          centerTitle: true,
//          title: Text('我的'),
//        ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: G_width(20), top: G_height(20), right: G_width(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: G_height(15)),
                alignment: Alignment.center,
                child: Text(
                  '我的',
                  style: TextStyle(
                    fontSize: G_font(17),
                    color: G_Color('#333131'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: G_height(30)),
                child: Text(
                  '我的',
                  style: TextStyle(
                    fontSize: G_font(24),
                    color: G_Color('#333131'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: G_height(24)),
                height: G_width(60),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/ins_help_you_nan.png"),
                      width: G_width(60),
                      height: G_width(60),
                    ),
                    Container(
//                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: G_width(16)),
                      child: Text(
                        '${userLoginEntity.username}',
                        style: TextStyle(
                          color: G_Color('#333131'),
                          fontSize: G_font(18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: G_height(40)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home),
                      Container(
                        margin: EdgeInsets.only(left: G_width(10)),
                        child: Text(
                          '查看我的资料',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'user_info_page',
                      arguments: userLoginEntity);
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: G_height(40)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.details),
                      Container(
                        margin: EdgeInsets.only(left: G_width(10)),
                        child: Text(
                          '关于我们',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'about_us_page');
                },
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: G_height(40)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      Container(
                        margin: EdgeInsets.only(left: G_width(10)),
                        child: Text(
                          '退出登录',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  bool isLoginOut = await showLoginOutDialog();
                  if (isLoginOut) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('LoginInfo', null);
                    eventBus.fire('');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showLoginOutDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('是否退出登录'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('确认退出'),
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
