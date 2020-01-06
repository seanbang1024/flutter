import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';
import 'package:flutter_app_loan/models/user_login_entityX.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    UserLoginEntity userLoginEntity = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '用户信息',
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: G_width(20), right: G_width(20), top: G_height(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: G_height(50),
              child: Text('用户ID：${userLoginEntity.id}'),
            ),
            Container(
              height: G_height(50),
              child: Text('用户名字：${userLoginEntity.username}'),
            ),
            Container(
              height: G_height(50),
              child: Text('用户邮件：${userLoginEntity.email}'),
            ),
            Container(
              height: G_height(50),
              child: Text(
                  '用户类型：${userLoginEntity.admin == true ? '管理员' : '普通用户'}'),
            ),
          ],
        ),
      ),
    );
  }
}
