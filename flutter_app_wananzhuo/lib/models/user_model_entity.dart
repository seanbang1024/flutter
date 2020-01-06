import 'package:flutter/material.dart';
class UserModelEntity with ChangeNotifier{
	String sex;
	String name;
	int id;
	notifyListeners();

	UserModelEntity({this.sex, this.name, this.id});

	UserModelEntity.fromJson(Map<String, dynamic> json) {
		sex = json['sex'];
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sex'] = this.sex;
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}

}
