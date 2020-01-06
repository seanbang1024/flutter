import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/Global.dart';
import 'package:flutter_app_loan/models/user_model_entity.dart';
import 'package:flutter_app_loan/widgets/about_us.dart';
import 'package:flutter_app_loan/widgets/home.dart';
import 'package:flutter_app_loan/widgets/index.dart';
import 'package:flutter_app_loan/widgets/login.dart';
import 'package:flutter_app_loan/widgets/regist.dart';
import 'package:flutter_app_loan/widgets/user_info.dart';
import 'package:flutter_app_loan/widgets/webview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'dart:convert' as convert;
import 'package:event_bus/event_bus.dart';

import 'models/user_login_entityX.dart';

EventBus eventBus = new EventBus();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  realRunApp();
}

void realRunApp() async {
  bool success = await SharedPreferencesUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider.value(value: UserModelEntity())
      ],
      child: MaterialApp(
        initialRoute: "/", //名为"/"的路由作为应用的home(首页)
        //注册路由表
        routes: {
          "Login_page": (context) => Login(),
          "Index_page": (context) => Index(),
          "Regist_page": (context) => Regist(),
          "Webview_page": (context) => WebViewPageCustom(),
          "user_info_page":(context) => UserInfo(),
          "about_us_page":(context) => AboutUs(),
          "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var loginState;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    eventBus.on().listen((eventBus) {
      setState(() {
        getLoginState();
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    getLoginState();
    if (loginState == null || loginState == 0) {
      return Login();
    } else {
      return TotalPage();
    }
  }

  getLoginState() {
    String json = SharedPreferencesUtil.preferences.getString('LoginInfo');
    loginState = 0;
    if (json != null) {
      Map<String, dynamic> user = convert.jsonDecode(json);
//      print('isLogin: $user');
      UserLoginEntity userLoginEntity = UserLoginEntity.fromJson(user);
      if (userLoginEntity != null) {
        loginState = 1;
      }
    }
  }
}
