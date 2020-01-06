import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';
import 'package:flutter_app_loan/commons/NetworkManager.dart';
import 'package:flutter_app_loan/main.dart';
import 'package:flutter_app_loan/models/base_model_entity.dart';
import 'package:flutter_app_loan/models/user_login_entityX.dart';
import 'package:flutter_app_loan/models/user_model_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(20),
                right: ScreenUtil.getInstance().setWidth(20),
                top: (ScreenUtil.getInstance()
                        .setHeight(ScreenUtil.statusBarHeight)) +
                    ScreenUtil.getInstance().setHeight(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      '登录',
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(17),
                          color: G_Color('#333131')),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(34)),
                  child: Text(
                    '登录',
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(24),
                        color: G_Color('#333131')),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(20)),
                  child: Text(
                    'Hi！欢迎来到玩安卓',
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(15),
                        color: G_Color('#999494')),
                  ),
                ),
//                Container(
//                  height: ScreenUtil.getInstance().setHeight(62),
//                  margin: EdgeInsets.only(
//                      left: ScreenUtil.getInstance().setWidth(16),
//                      right: ScreenUtil.getInstance().setWidth(16),
//                      top: ScreenUtil.getInstance().setHeight(16)),
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: TextField(
//                          autofocus: false,
//                          decoration: InputDecoration(
//                            hintText: '请输入手机号',
//                            border: InputBorder.none,
//                          ),
//                        ),
//                      ),
//                      FlatButton(
//                        padding: EdgeInsets.only(
//                            left: ScreenUtil.getInstance().setWidth(16),
//                            right: ScreenUtil.getInstance().setWidth(16)),
//                        onPressed: getMessageCode,
//                        child: Text(
//                          '获取验证码',
//                          style: TextStyle(
//                            color: G_Color('#F26161'),
//                            fontSize: ScreenUtil.getInstance().setSp(15),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
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
                  height: ScreenUtil.getInstance().setHeight(44),
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(40)),
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
                            '登录',
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
                Container(
                  height: ScreenUtil.getInstance().setHeight(44),
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(10)),
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
                          onPressed: setRegist,
                          child: Text(
                            '注册',
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
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(24)),
                  child: Center(
                    child: Text(
                      '阅读并同意协议',
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(12),
                          color: G_Color('#333131')),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  setLoginState() async {
    if (usernameEC.text.isEmpty || passwordEC.text.isEmpty) {
      Fluttertoast.showToast(msg: '请填写完整信息');
      return;
    }
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
      } else {
        Fluttertoast.showToast(msg: baseModelEntity.errorMsg);
      }
    }, (error) {
      Fluttertoast.showToast(msg: '登录失败');
    });
  }

  getMessageCode() {}

  setRegist() {
    Navigator.pushNamed(context, 'Regist_page');
  }
}
