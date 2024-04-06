import 'package:komikoproject/data/remote_data/komik_data.dart';
import 'package:komikoproject/domain/model/komik/baca_model.dart';
import 'package:komikoproject/domain/model/komik/detail_model.dart';
import 'package:komikoproject/domain/model/komik/komik_model_1.dart';
import 'package:komikoproject/domain/model/komik/komik_model_2.dart';
import 'package:komikoproject/domain/model/komik/komik_model_3.dart';
import 'package:komikoproject/domain/model/komik/komik_model_4.dart';

import '../model/komik/komik_model_5.dart';

class KomikDataRepositori {
  //===tanpa page

  Future<List<KomikModel1>> terpopular() async {
    try {
      final data = await KomikData().terpopular();
      List response = data['data'];
      return response.map((e) => KomikModel1.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<KomikModel1>> berwarna() async {
    try {
      final data = await KomikData().berwarna();
      List response = data['data'];
      return response.map((e) => KomikModel1.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<KomikModel2>> terbaru() async {
    try {
      final data = await KomikData().terbaru();
      List response = data['data'];
      return response.map((e) => KomikModel2.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<KomikModel3>> romantis() async {
    try {
      final data = await KomikData().romantis();
      List response = data['data'];
      return response.map((e) => KomikModel3.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<KomikModel3>> isekai() async {
    try {
      final data = await KomikData().isekai();
      List response = data['data'];
      return response.map((e) => KomikModel3.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<KomikModel3>> fantasi() async {
    try {
      final data = await KomikData().fantasi();
      List response = data['data'];
      return response.map((e) => KomikModel3.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<KomikModel3>> aksi() async {
    try {
      final data = await KomikData().aksi();
      List response = data['data'];
      return response.map((e) => KomikModel3.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<String>> genre() async {
    try {
      final data = await KomikData().genre();
      List response = data['data'];
      return response.map((e) => e.toString()).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<String>> tema() async {
    try {
      final data = await KomikData().tema();
      List response = data['data'];
      return response.map((e) => e.toString()).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //===dengan page

  Future<List<KomikModel3>> search({required String key}) async {
    try {
      final data = await KomikData().search(key: key);
      List response = data['data'];
      return response.map((e) => KomikModel3.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<KomikModel5> popular_page({required String page}) async {
    try {
      final data = await KomikData().popular_page(page: page);
      return KomikModel5.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<KomikModel4> berwarna_page({required String page}) async {
    try {
      final data = await KomikData().berwarna_page(page: page);
      return KomikModel4.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<KomikModel4> genre_page(
      {required String key, required String page}) async {
    try {
      final data = await KomikData().genre_page(key: key, page: page);
      return KomikModel4.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<KomikModel4> tipe_page(
      {required String key, required String page}) async {
    try {
      final data = await KomikData().tipe_page(key: key, page: page);
      return KomikModel4.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<KomikModel4> tema_page(
      {required String key, required String page}) async {
    try {
      final data = await KomikData().tema_page(key: key, page: page);
      return KomikModel4.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //===detail komik

  Future<DetailKomikModel> detail_komik({required String url}) async {
    try {
      final data = await KomikData().detail_komik(url: url);
      return DetailKomikModel.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<BacaKomikModel> baca_komik({required String url}) async {
    try {
      final data = await KomikData().baca_komik(url: url);
      return BacaKomikModel.fromJson(data['data']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
