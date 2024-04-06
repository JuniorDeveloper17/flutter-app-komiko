import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  Future<SharedPreferences> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  Future token() async {
    final tokens = await init().then((value) => value.getString('token'));
    if (tokens == null) {
      return '';
    } else {
      return tokens;
    }
  }

  Future  save_token({required String token}) async {
    final tokens =
        await init().then((value) => value.setString('token', token));
    return tokens;
  }
}
