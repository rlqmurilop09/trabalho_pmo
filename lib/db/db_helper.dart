import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'app.db');

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreateDB,
    );

    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {

    // Tabela de avisos
    await db.execute('''
      CREATE TABLE AVISO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        corIcone TEXT,
        corFundo TEXT,
        titulo TEXT,
        descricao TEXT,
        data TEXT
      );
    ''');

    // Tabela de doações
    await db.execute('''
      CREATE TABLE DOACAO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ong TEXT,
        valor REAL,
        metodoPagamento TEXT
      );
    ''');

    // Dados iniciais da tabela AVISO
    await db.execute(
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#4CAF50', 'Vacinação', 'Leve seu pet para vacinar.', '20/06/2025');"
    );

    await db.execute(
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#2196F3', 'Consulta', 'Consulta veterinária agendada.', '22/06/2025');"
    );

    await db.execute(
        "INSERT INTO AVISO (corIcone, corFundo, titulo, descricao, data) VALUES ('#FFFFFF', '#FF9800', 'Banho', 'Horário marcado para banho.', '25/06/2025');"
    );
  }

  // INSERIR DOAÇÃO
  Future<int> inserirDoacao({
    required String ong,
    required double valor,
    required String metodoPagamento,
  }) async {

    Database db = await initDB();

    return await db.insert(
      'DOACAO',
      {
        'ong': ong,
        'valor': valor,
        'metodoPagamento': metodoPagamento,
      },
    );
  }

  // LISTAR DOAÇÕES
  Future<List<Map<String, dynamic>>> listarDoacoes() async {

    Database db = await initDB();

    return await db.query(
      'DOACAO',
      orderBy: 'id DESC',
    );
  }

}