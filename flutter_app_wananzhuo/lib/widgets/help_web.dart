import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';
import 'package:flutter_app_loan/commons/NetworkManager.dart';
import 'package:flutter_app_loan/models/base_model_entity.dart';
import 'package:flutter_app_loan/models/help_web_model_entity.dart';
import 'package:flutter_app_loan/models/web_model_entity.dart';

class HelpWebs extends StatefulWidget {
  @override
  _HelpWebsState createState() => _HelpWebsState();
}

class _HelpWebsState extends State<HelpWebs>
    with AutomaticKeepAliveClientMixin {
  List<HelpWebModelEntity> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '帮助中心'
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: G_width(20), right: G_width(20)),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0
          ),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                color: getRandomColor(),
                margin: EdgeInsets.only(left: G_width(5), right: G_width(5), top: G_height(5), bottom: G_height(5)),
                padding: EdgeInsets.only(left: G_width(5), right: G_width(5), top: G_height(5), bottom: G_height(5)),
                alignment: Alignment.center,
                child: Text(
                  '${listData[index].name}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                HelpWebModelEntity model = listData[index];
                WebModelEntity webM = WebModelEntity();
                webM.title = model.name;
                webM.url = model.link;
                Navigator.pushNamed(context, 'Webview_page',
                    arguments: webM);
              },
            );
          },
        ),
      ),
    );
  }

  getRandomColor() {
    print('getRandomColor');
    return Color.fromARGB(
        255,
        Random.secure().nextInt(255),
        Random.secure().nextInt(255),
        Random.secure().nextInt(255));
  }

  getListData() {
    DioManager.getInstance().get('/friend/json', null,
        (BaseModelEntity baseModelEntity) {
      setState(() {
        listData = new List<HelpWebModelEntity>();
        (baseModelEntity.data as List).forEach((v) {
          listData.add(new HelpWebModelEntity.fromJson(v));
        });
//        print(listData);
      });
    }, null);
  }

  @override
  bool get wantKeepAlive => true;
}
