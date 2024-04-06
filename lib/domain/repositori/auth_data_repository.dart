import 'package:komikoproject/data/local_data/database_service.dart';
import 'package:komikoproject/data/local_data/local_data.dart';
import 'package:komikoproject/data/remote_data/auth_data.dart';
import 'package:komikoproject/domain/model/komik/komik_model_favorid.dart';

class AuthDataRepository {
  Future<String> token() async {
    try {
      final data = await AuthData().token();
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> send_email({required String messege}) async {
    final data = await AuthData().send_email(messege: messege);
    if (data == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> local_token() async {
    try {
      String data = await LocalDatabase().token();
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> save_token({required String token}) async {
    try {
      bool data = await LocalDatabase().save_token(token: token);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> save_favorid({required KomikModelFavorid data}) async {
    try {
      final relust = await DatabaseService().insert_favorid(data.toJson());
      return relust;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> delete_favorid({required int id}) async {
      final data = await DatabaseService().delete(id);
      if (data == true) {
        return true;
      } else {
        return false;
      }
   
  }

  Future<List<KomikModelFavorid>> get_favorid() async {
    try {
      final result = await DatabaseService().get_favorid();
      List data = List.from(result);
      return data.map((e) => KomikModelFavorid.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
