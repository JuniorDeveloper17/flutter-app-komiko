import 'dart:convert';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;

class AuthData {
  String baseUrl =
      'https://komiko-d1a0c-default-rtdb.asia-southeast1.firebasedatabase.app';

  Future token() async {
    Uri url = Uri.parse('$baseUrl/token.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future send_email({required String messege}) async {
    try {
      Email email = Email(
          body: messege,
          subject: 'USER KOMIKO APP',
          recipients: ['ryanhappyjalay2461@gmail.com'],
          isHTML: false);

      await FlutterEmailSender.send(email);
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
