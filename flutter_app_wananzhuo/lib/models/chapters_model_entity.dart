import 'package:flutter_app_loan/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_loan/generated/json/base/json_filed.dart';

class ChaptersModelEntity with JsonConvert<ChaptersModelEntity> {
	List<dynamic> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}
