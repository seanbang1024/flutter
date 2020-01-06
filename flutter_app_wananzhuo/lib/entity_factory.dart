import 'package:flutter_app_loan/models/banner_model_entity.dart';
import 'package:flutter_app_loan/models/banner_model_list_entity.dart';
import 'package:flutter_app_loan/models/user_model_entity.dart';
import 'package:flutter_app_loan/models/nav_type_model_entity.dart';
import 'package:flutter_app_loan/models/help_web_model_entity.dart';
import 'package:flutter_app_loan/models/home_article_listX_entity.dart';

import 'models/web_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerModelEntity") {
      return BannerModelEntity.fromJson(json) as T;
    } else if (T.toString() == "BannerModelListEntity") {
      return BannerModelListEntity.fromJson(json) as T;
    } else if (T.toString() == "UserModelEntity") {
      return UserModelEntity.fromJson(json) as T;
    } else if (T.toString() == "NavTypeModelEntity") {
      return NavTypeModelEntity.fromJson(json) as T;
    } else if (T.toString() == "HelpWebModelEntity") {
      return HelpWebModelEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeArticleListXEntity") {
      return HomeArticleListXEntity.fromJson(json) as T;
    } else if (T.toString() == "WebModelEntity") {
      return WebModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}