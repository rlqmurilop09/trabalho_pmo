import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Future<Database> initDB() async {

    String path = await getDatabasesPath();
    String dbName = 'app.db';

    String dbPath = join(path, dbName);

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreateDB,
    );

    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {

    String sql = '''
      CREATE TABLE DOACAO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ong TEXT,
        valor REAL,
        metodoPagamento TEXT
      );
    ''';

    await db.execute(sql);

    sql =
    "INSERT INTO DOACAO (ong, valor, metodoPagamento) VALUES ('ONG Exemplo 1', 50.00, 'PIX');";
    await db.execute(sql);

    sql =
    "INSERT INTO DOACAO (ong, valor, metodoPagamento) VALUES ('ONG Exemplo 2', 100.00, 'Crédito');";
    await db.execute(sql);

    sql =
    "INSERT INTO DOACAO (ong, valor, metodoPagamento) VALUES ('ONG Exemplo 1', 25.00, 'Débito');";
    await db.execute(sql);

    sql =
    "INSERT INTO DOACAO (ong, valor, metodoPagamento) VALUES ('ONG Exemplo 2', 75.00, 'PIX');";
    await db.execute(sql);
  }

}