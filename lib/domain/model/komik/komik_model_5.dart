import 'package:komikoproject/domain/model/komik/komik_model_3.dart';

class KomikModel5 {
  String? pageNow;
  String? maxPage;
  List<KomikModel3>? data;

  KomikModel5({this.pageNow, this.maxPage, this.data});

  KomikModel5.fromJson(Map<String, dynamic> json) {
    pageNow = json['pageNow'];
    maxPage = json['maxPage'];
    if (json['data'] != null) {
      data = <KomikModel3>[];
      json['data'].forEach((v) {
        data!.add(new KomikModel3.fromJson(v));
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
