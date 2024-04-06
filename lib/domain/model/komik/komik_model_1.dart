class KomikModel1 {
  String? image;
  String? title;
  String? color;
  String? type;
  String? chapter;
  String? updateAt;
  String? url;

  KomikModel1(
      {this.image,
      this.title,
      this.color,
      this.type,
      this.chapter,
      this.updateAt,
      this.url});

  KomikModel1.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    color = json['color'];
    type = json['type'];
    chapter = json['chapter'];
    updateAt = json['updateAt'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['color'] = this.color;
    data['type'] = this.type;
    data['chapter'] = this.chapter;
    data['updateAt'] = this.updateAt;
    data['url'] = this.url;
    return data;
  }
}