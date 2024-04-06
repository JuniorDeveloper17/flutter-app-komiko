class KomikModelFavorid {
  String? image;
  String? title;
  String? ratting;
  String? url;
  String? jenis;
  int? id;

  KomikModelFavorid(
      {this.image, this.title, this.ratting, this.url, this.jenis, this.id});

  KomikModelFavorid.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    ratting = json['ratting'];
    url = json['url'];
    jenis = json['jenis'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['ratting'] = this.ratting;
    data['url'] = this.url;
    data['jenis'] = this.jenis;
    data['id'] = this.id;
    return data;
  }
}
