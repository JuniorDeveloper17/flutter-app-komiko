import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseService {
  final String _databaseName = 'database_01.db';
  final int _databaseVersion = 1;

  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreat);
  }

  //=======================================================================================

  final String table_favorid = 'favorid_table';
  final String id_komik = 'id';
  final String image = ' image';
  final String title = ' title';
  final String ratting = ' ratting';
  final String jenis = 'jenis';
  final String url = ' url';

  Future _onCreat(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table_favorid ($id_komik INTEGER PRIMARY KEY, $image TEXT NULL, $title TEXT NULL, $ratting TEXT NULL, $url TEXT NULL, $jenis TEXT NULL)');
  }

  Future<int> insert_favorid(Map<String, dynamic> row) async {
    if (_database == null) {
      _database = await database();
    }
    final query = await _database!.insert(table_favorid, row);
    return query;
  }

  Future delete(int idParam) async {
    if (_database == null) {
      _database = await database();
    }
    await _database!
        .delete(table_favorid, where: '$id_komik = ?', whereArgs: [idParam]);
    return true;
  }

  Future get_favorid() async {
    if (_database == null) {
      _database = await database();
    }
    final data = await _database!.query(table_favorid);
    return data;
  }
}
