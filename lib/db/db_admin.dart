import 'dart:io';

import 'package:flutter_codigo_vacunaapp/models/license_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBAdmin {
  Database? _myDatabase;

  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> checkDatabase() async {
    if (_myDatabase != null) {
      return _myDatabase;
    }
    _myDatabase = await initDatabase();
    return _myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LicenseDB.db");
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(""
            "CREATE TABLE LICENSE(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dni TEXT, url TEXT)");
      },
    );
  }

  Future<int> insertLicense(LicenseModel licenseModel) async {
    final Database? db = await checkDatabase();
    int res = await db!.insert(
      "LICENSE",
      // {
      //   "name": licenseModel.name,
      //   "dni": licenseModel.dni,
      //   "url": licenseModel.url,
      // },
      licenseModel.toJson(),
    );
    return res;
  }
}
