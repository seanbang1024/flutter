import 'package:flutter_app_loan/models/chapters_model_entity.dart';
import 'package:flutter_app_loan/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

chaptersModelEntityFromJson(ChaptersModelEntity data, Map<String, dynamic> json) {
	if (json['children'] != null) {
		data.children = new List<dynamic>();
		data.children.addAll(json['children']);
	}
	data.courseId = json['courseId']?.toInt();
	data.id = json['id']?.toInt();
	data.name = json['name']?.toString();
	data.order = json['order']?.toInt();
	data.parentChapterId = json['parentChapterId']?.toInt();
	data.userControlSetTop = json['userControlSetTop'];
	data.visible = json['visible']?.toInt();
	return data;
}

Map<String, dynamic> chaptersModelEntityToJson(ChaptersModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.children != null) {
		data['children'] =  [];
	}
	data['courseId'] = entity.courseId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}