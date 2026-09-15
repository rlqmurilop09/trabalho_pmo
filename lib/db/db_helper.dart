import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Future<Database>initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'app-2.db';

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
    data TEXT
    
    );
    ''';

    await db.execute(sql);

    sql =
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#4CAF50', 'Feira de Adoção', 'Venha conhecer e adotar bichinhos na Praça Ceci Cunha.', '20/06/2025');";
    await db.execute(sql);

    sql =
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#2196F3', 'Campanha de Vacinação', 'Vacinação gratuita para cães e gatos.', '22/06/2025');";
    await db.execute(sql);

    sql =
    "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#FF9800', 'Multirão de Limpeza no Abrigo', 'Venha ser um voluntário.', '25/06/2025');";
    await db.execute(sql);

    sql =
    "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#9D00FF', 'Arrecadação de Alimentos', 'Nossa ONG conta com sua colaboração.', '29/06/2025');";
    await db.execute(sql);

    sql =
    "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#FF69B4', 'Feira de Adoção', 'Conheça o seu futuro bichinho!', '04/07/2025');";
    await db.execute(sql);



    sql = '''
    CREATE TABLE USER(
      username TEXT PRIMARY KEY,
      password TEXT
    );''';

    await db.execute(sql);

    sql = "INSERT INTO USER (username, password) VALUES ('joao@gmail.com', '123456');";
    await db.execute(sql);


    sql = "INSERT INTO USER (username, password) VALUES ('mariaclara@gmail.com', '123456');";
    await db.execute(sql);


    sql = "INSERT INTO USER (username, password) VALUES ('murilo@gmail.com', '123456');";
    await db.execute(sql);


    sql = "INSERT INTO USER (username, password) VALUES ('cristiane@gmail.com', '123456');";
    await db.execute(sql);

  }


}
