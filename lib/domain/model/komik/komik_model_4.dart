import 'package:komikoproject/domain/model/komik/komik_model_1.dart';

class KomikModel4 {
  String? pageNow;
  String? maxPage;
  List<KomikModel1>? data;

  KomikModel4({this.pageNow, this.maxPage, this.data});

  KomikModel4.fromJson(Map<String, dynamic> json) {
    pageNow = json['pageNow'];
    maxPage = json['maxPage'];
    if (json['data'] != null) {
      data = <KomikModel1>[];
      json['data'].forEach((v) {
        data!.add(new KomikModel1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNow'] = this.pageNow;
    data['maxPage'] = this.maxPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
