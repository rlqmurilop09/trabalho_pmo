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


  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''
    CREATE TABLE AVISO (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    corIcone TEXT, 
    corFundo TEXT,
    titulo TEXT,
    descricao TEXT,
    data TEXT,
    
    );
    ''';

    await db.execute(sql);

    sql =
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#4CAF50', 'Vacinação', 'Leve seu pet para vacinar.', '20/06/2025');";
    await db.execute(sql);

    sql =
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#2196F3', 'Consulta', 'Consulta veterinária agendada.', '22/06/2025');";
    await db.execute(sql);

    sql =
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#FF9800', 'Banho', 'Horário marcado para banho.', '25/06/2025');";
    await db.execute(sql);



  }


}
