class HelpWebModelEntity {
	int visible;
	String icon;
	String link;
	String name;
	int id;
	int order;

	HelpWebModelEntity({this.visible, this.icon, this.link, this.name, this.id, this.order});

	HelpWebModelEntity.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		icon = json['icon'];
		link = json['link'];
		name = json['name'];
		id = json['id'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		data['icon'] = this.icon;
		data['link'] = this.link;
		data['name'] = this.name;
		data['id'] = this.id;
		data['order'] = this.order;
		return data;
	}
}
