import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'Adocao';
    String dbPath = join(path, dbName);
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE PROPRIEDADE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            urlImage TEXT,
            nome TEXT,
            idade TEXT,
            genero TEXT,
            especie TEXT,
            porte TEXT,
            raca TEXT,
            vacinado TEXT,
            castrado TEXT
        );''';

    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (urlImage, nome, idade, genero, especie, porte, raca, vacinado, castrado) VALUES ('https://static.todamateria.com.br/upload/sh/ut/shutterstock1411747946-cke.jpg', 'Mica', 'Idade: 5 meses', 'Gênero: Fêmea','Espécie: Coelho','Porte: Pequeno','Raça: New Zealeand red','Vacinado','castrado');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (urlImage, nome, idade, genero, especie, porte, raca, vacinado, castrado) VALUES ('https://i.pinimg.com/736x/e1/f8/f0/e1f8f02350b47bc169feb4664329a898.jpg', 'Lina', 'Idade: 2 anos', 'Gênero: Fêmea', 'Espécie: Cachorro', 'Porte: Grande', 'Raça: SRD (Sem raça definida)', 'Vacinado','Castrado');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (urlImage, nome, idade, genero, especie, porte, raca, vacinado, castrado) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPyw5XkJrzCGPFjK_btUeBLGk2cWAtpmWFHg&s', 'Hector', 'Idade: 3 anos', 'Gênero: Macho', 'Especie: gato', 'Porte: médio', 'Raça: Persa', 'vacinado', 'castrado');";
    await db.execute(sql);

    sql =
    "INSERT INTO Propriedade (urlImage, nome, idade, genero, especie, porte, raca, vacinado, castrado) VALUES ('https://odia.ig.com.br/_midias/jpg/2024/05/22/passaros_domesticos-32914698.jpg', 'Pepita', '1 ano', 'Femea', 'Especie: Ave', 'Porte: Pequeno', 'Raça: Calopsita', 'X', 'Castrado');";
    await db.execute(sql);
  }
}