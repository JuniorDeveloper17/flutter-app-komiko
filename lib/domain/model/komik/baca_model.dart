class BacaKomikModel {
  String? title;
  String? chapterBegin;
  String? chapterNext;
  List<String>? image;

  BacaKomikModel({this.title, this.chapterBegin, this.chapterNext, this.image});

  BacaKomikModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    chapterBegin = json['chapterBegin'];
    chapterNext = json['chapterNext'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['chapterBegin'] = this.chapterBegin;
    data['chapterNext'] = this.chapterNext;
    data['image'] = this.image;
    return data;
  }
}