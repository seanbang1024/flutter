class WebModelEntity {
	String title;
	String url;

	WebModelEntity({this.title, this.url});

	WebModelEntity.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['url'] = this.url;
		return data;
	}
}
