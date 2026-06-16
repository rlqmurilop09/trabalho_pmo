import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  initDB() async {
    String path = await getDatabasesPath();
    String dbName = '/app.db';

    String dbPath = join(path, dbName);

    Database db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: onCreateDB

    );

    return db;
  }


  FutureOr<void> onCreateDB(Database db, int version) {
    String sql = '''
    CREATE TABLE AVISO (
    id INTERGER PRIMARY KEY AUTOINCREMENT,
    
    );
    ''';

  }


}
