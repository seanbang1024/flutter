import 'package:flutter/material.dart';
import 'package:flutter_app_loan/commons/ColorUtil.dart';
import 'package:flutter_app_loan/commons/NetworkManager.dart';
import 'package:flutter_app_loan/models/banner_model_list_entity.dart';
import 'package:flutter_app_loan/models/base_model_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app_loan/models/home_article_listX_entity.dart';
import 'package:flutter_app_loan/models/web_model_entity.dart';

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin {
  var listData;
  List<HomeArticleListXData> homeArticleList = List<HomeArticleListXData>();

  int current = 0;
  int page = 0;
  bool isRequest = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData();
    isRequest = true;
    getArticleList();
  }

  getListData() {
    DioManager.getInstance().get('/banner/json', null,
        (BaseModelEntity baseModelEntity) {
      setState(() {
        listData = new List<BannerModelListEntity>();
        (baseModelEntity.data as List).forEach((v) {
          listData.add(new BannerModelListEntity.fromJson(v));
        });
//        print(listData);
      });
    }, null);
  }

  getArticleList() {
    if (isRequest) {
      isRequest = false;
      DioManager.getInstance().get('/article/list/$page/json', null,
          (BaseModelEntity baseModelEntity) {
        setState(() {
          HomeArticleListXEntity homeArticleListXEntity =
              HomeArticleListXEntity.fromJson(baseModelEntity.data);
          homeArticleList.addAll(homeArticleListXEntity.datas);
          print(homeArticleList);
          isRequest = true;
        });
      }, null);
    }
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('首页'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            createBananer(),
//            Container(
//              child: CarouselSlider(
//                height: G_height(130),
//                autoPlay: true,
//                viewportFraction: 1.0,
////                aspectRatio: 2.0,
//                onPageChanged: (index) {
//                  setState(() {
//                    current = index;
//                  });
//                },
//                items: map(listData, (index, BannerModelListEntity model) {
//                  return Container(
//                    padding:
//                    EdgeInsets.only(left: G_width(5), right: G_width(5)),
//                    child: GestureDetector(
//                      child: Image(
//                        image: NetworkImage(model.imagePath),
//                        fit: BoxFit.cover,
//                      ),
//                      onTap: () {
//                        WebModelEntity webM = WebModelEntity();
//                        webM.title = model.title;
//                        webM.url = model.url;
//                        Navigator.pushNamed(context, 'Webview_page',
//                            arguments: webM);
//                      },
//                    ),
//                  );
//                }),
//              ),
//            ),
            NotificationListener<ScrollNotification>(
              // ignore: missing_return
              onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
//                print('progress:$progress');
                setState(() {
                  if (progress >= 0.8) {
                    isRequest = true;
                    ++page;
                    getArticleList();
                  }
                });
              },
              child: Flexible(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${homeArticleList[index].title}',
                              ),
                              Container(
                                margin: EdgeInsets.only(top: G_height(5)),
                                child: Text(
                                  '${homeArticleList[index].niceDate}',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: G_font(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          WebModelEntity webM = WebModelEntity();
                          webM.title = homeArticleList[index].title;
                          webM.url = homeArticleList[index].link;
                          Navigator.pushNamed(context, 'Webview_page',
                              arguments: webM);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(height: 0),
                    itemCount: homeArticleList.length),
              ),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: loginOutFun,
//        child: Text('回顶部'),
//      ),
    );
  }

  loginOutFun() async {}

  createBananer() {
    if(listData == null) {
      return Container(
        alignment: Alignment.center,
        height: G_height(130),
        child: Text(
          '数据加载中',
        ),
      );
    } else {
      return Container(
        child: CarouselSlider(
          height: G_height(130),
          autoPlay: true,
          viewportFraction: 1.0,
//                aspectRatio: 2.0,
          onPageChanged: (index) {
            setState(() {
              current = index;
            });
          },
          items: map(listData, (index, BannerModelListEntity model) {
            return Container(
              padding:
              EdgeInsets.only(left: G_width(5), right: G_width(5)),
              child: GestureDetector(
                child: Image(
                  image: NetworkImage(model.imagePath),
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  WebModelEntity webM = WebModelEntity();
                  webM.title = model.title;
                  webM.url = model.url;
                  Navigator.pushNamed(context, 'Webview_page',
                      arguments: webM);
                },
              ),
            );
          }),
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}
