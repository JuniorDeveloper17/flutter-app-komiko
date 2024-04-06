import 'dart:convert';
import 'package:http/http.dart' as http;

class KomikData {
  String baseUrl = 'http://192.168.198.71:3000';

  //===tanpa page

  Future terpopular() async {
    Uri url = Uri.parse('$baseUrl/terpopular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future berwarna() async {
    Uri url = Uri.parse('$baseUrl/berwarna');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future terbaru() async {
    Uri url = Uri.parse('$baseUrl/terbaru');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future romantis() async {
    Uri url = Uri.parse('$baseUrl/romantis');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future isekai() async {
    Uri url = Uri.parse('$baseUrl/isekai');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future fantasi() async {
    Uri url = Uri.parse('$baseUrl/fantasi');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future aksi() async {
    Uri url = Uri.parse('$baseUrl/aksi');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future genre() async {
    Uri url = Uri.parse('$baseUrl/genre');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future tema() async {
    Uri url = Uri.parse('$baseUrl/tema');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  //===dengan page

  Future search({required String key}) async {
    Uri urls = Uri.parse('$baseUrl/search/${key}');
    final response = await http.get(urls);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future popular_page({required String page}) async {
    Uri url = Uri.parse('$baseUrl/populars/${page}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future berwarna_page({required String page}) async {
    Uri url = Uri.parse('$baseUrl/berwarnas/${page}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future genre_page({required String key, required String page}) async {
    Uri url = Uri.parse('$baseUrl/genres/${key}/${page}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future tipe_page({required String key, required String page}) async {
    Uri url = Uri.parse('$baseUrl/types/${key}/${page}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future tema_page({required String key, required String page}) async {
    Uri url = Uri.parse('$baseUrl/temas/${key}/${page}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  //===detail komik

  Future detail_komik({required String url}) async {
    Uri urls = Uri.parse('$baseUrl/detail${url}');
    final response = await http.get(urls);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future baca_komik({required String url}) async {
    Uri urls = Uri.parse('$baseUrl/baca${url}');
    final response = await http.get(urls);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
