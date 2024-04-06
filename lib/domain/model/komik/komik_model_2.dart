class KomikModel2 {
  String? image;
  String? title;
  String? ratting;
  String? type;
  String? views;
  String? color;
  String? status;
  String? chapter;
  String? url;

  KomikModel2(
      {this.image,
      this.title,
      this.ratting,
      this.type,
      this.views,
      this.color,
      this.status,
      this.chapter,
      this.url});

  KomikModel2.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    ratting = json['ratting'];
    type = json['type'];
    views = json['views'];
    color = json['color'];
    status = json['status'];
    chapter = json['chapter'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['ratting'] = this.ratting;
    data['type'] = this.type;
    data['views'] = this.views;
    data['color'] = this.color;
    data['status'] = this.status;
    data['chapter'] = this.chapter;
    data['url'] = this.url;
    return data;
  }
}