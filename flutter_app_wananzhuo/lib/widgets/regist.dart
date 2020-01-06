import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';
import 'package:flutter_app_loan/commons/NetworkManager.dart';
import 'package:flutter_app_loan/main.dart';
import 'package:flutter_app_loan/models/base_model_entity.dart';
import 'package:flutter_app_loan/models/user_login_entityX.dart';
import 'package:flutter_app_loan/models/user_model_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class Regist extends StatefulWidget {
  @override
  _RegistState createState() => _RegistState();
}

class _RegistState extends State<Regist> {
  TextEditingController usernameEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  TextEditingController repasswordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(62),
              child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(16),
                    right: ScreenUtil.getInstance().setWidth(16),
                    top: ScreenUtil.getInstance().setHeight(16)),
                child: TextField(
                  controller: usernameEC,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: '请输入账号',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              color: G_Color('#F5EDED'),
              height: ScreenUtil.getInstance().setHeight(0.5),
            ),
            Container(
              height: ScreenUtil.getInstance().setHeight(62),
              child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(16),
                    right: ScreenUtil.getInstance().setWidth(16),
                    top: ScreenUtil.getInstance().setHeight(16)),
                child: TextField(
                  controller: passwordEC,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: '请输入密码',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              color: G_Color('#F5EDED'),
              height: ScreenUtil.getInstance().setHeight(0.5),
            ),
            Container(
              color: G_Color('#F5EDED'),
              height: ScreenUtil.getInstance().setHeight(0.5),
            ),
            Container(
              height: ScreenUtil.getInstance().setHeight(62),
              child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(16),
                    right: ScreenUtil.getInstance().setWidth(16),
                    top: ScreenUtil.getInstance().setHeight(16)),
                child: TextField(
                  controller: repasswordEC,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: '请再次输入密码',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              color: G_Color('#F5EDED'),
              height: ScreenUtil.getInstance().setHeight(0.5),
            ),
            Container(
              height: ScreenUtil.getInstance().setHeight(44),
              margin:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenUtil.getInstance().setHeight(22))),
                      padding: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(16),
                          right: ScreenUtil.getInstance().setWidth(16)),
                      onPressed: setLoginState,
                      child: Text(
                        '注册并登录',
                        style: TextStyle(
                          color: G_Color('#FFFFFF'),
                          fontSize: ScreenUtil.getInstance().setSp(15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  setLoginState() async {
    if (usernameEC.text.isEmpty ||
        passwordEC.text.isEmpty ||
        repasswordEC.text.isEmpty) {
      Fluttertoast.showToast(msg: '请填写完整信息');
      return;
    }

    if (passwordEC.text != repasswordEC.text) {
      Fluttertoast.showToast(msg: '两次输入密码不相同');
      return;
    }

    Map<String, dynamic> map = Map();
    map["username"] = usernameEC.text;
    map["password"] = passwordEC.text;
    map["repassword"] = repasswordEC.text;

    DioManager.getInstance().post('/user/register', map,
        (BaseModelEntity baseModelEntity) {
      if (baseModelEntity.errorCode == 0) {
        UserLoginEntity userLoginEntity =
            UserLoginEntity.fromJson(baseModelEntity.data);
//        print(userLoginEntity.username);
        loginSuccess(userLoginEntity);
      } else {
        Fluttertoast.showToast(msg: baseModelEntity.errorMsg);
      }
    }, (error) {
      Fluttertoast.showToast(msg: '注册失败');
    });
  }

  void loginSuccess(UserLoginEntity userLoginEntity) {
    Map<String, dynamic> map = Map();
    map["username"] = usernameEC.text;
    map["password"] = passwordEC.text;
    DioManager.getInstance().post('/user/login', map,
        (BaseModelEntity baseModelEntity) async {
      if (baseModelEntity.errorCode == 0) {
        UserLoginEntity userLoginEntity =
            UserLoginEntity.fromJson(baseModelEntity.data);

        String userJsonString = convert.jsonEncode(userLoginEntity.toJson());
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('LoginInfo', userJsonString);
        eventBus.fire('');
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(msg: baseModelEntity.errorMsg);
      }
    }, (error) {
      Fluttertoast.showToast(msg: '登录失败');
    });
  }
}
