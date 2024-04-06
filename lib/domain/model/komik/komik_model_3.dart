class KomikModel3 {
  String? image;
  String? title;
  String? ratting;
  String? color;
  String? type;
  String? url;

  KomikModel3(
      {this.image, this.title, this.ratting, this.color, this.type, this.url});

  KomikModel3.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    ratting = json['ratting'];
    color = json['color'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['ratting'] = this.ratting;
    data['color'] = this.color;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}