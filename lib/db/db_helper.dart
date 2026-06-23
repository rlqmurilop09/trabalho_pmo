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

    //tabela murilo
    String sql = '''
      CREATE TABLE DOACAO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ong TEXT,
        valor REAL,
        metodoPagamento TEXT
      );
    ''';

    await db.execute(sql);

    //tabela clara
    sql = '''
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

    //tabela beatriz
    sql = ''' CREATE TABLE PROPRIEDADE (
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

    //tabela jamylle
    sql = ''' CREATE TABLE HISTORIA (
    nome TEXT NOT NULL,
            adotado TEXT NOT NULL,
            historia TEXT NOT NULL,
            urlImage TEXT NOT NULL
        );''';
    await db.execute(sql);

    //db murilo
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

    //db clara
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

    //db jamylle
    sql =
    "INSERT INTO HISTORIA (nome, adotado, historia, urlImage) VALUES ('Alberto            10/04/2019',"
        " 'Adotado pela familia Bispo', 'Um pintinho pequeno e cheio de energia, resgatado com muito cuidado. Curioso e alegre, ele adora explorar e ficar perto de quem cuida dele. Agora, vive em um lar seguro, cheio de carinho e atenção',"
        " '(https://www.chumbogordo.com.br/wp-content/uploads/2022/07/pinto-pequeno-400x380.jpg');";
    await db.execute(sql);

    sql =
    "INSERT INTO HISTORIA (nome, adotado, historia, urlImage) VALUES ('mia              10/02/2023', "
        "'Pela familia Jacinto', 'Uma gatinha encontrada em um dia de chuva pelas ruas, docel,carinhosa e que so precisava de muito amor e carinho.A familia jacinto pode dar muito carinhgo para a nossa gatinha',"
        " ('https://i0.statig.com.br/bancodeimagens/1t/19/gk/1t19gkv4wj56sujljd2n2h97j.jpg')";
    await db.execute(sql);

    sql = "INSERT INTO HISTORIA (nome, adotado, historia, urlImage) VALUES ('Bob           "
        "19/03/2013', 'Adotado pela familia Santos', 'Bob um cachooro docel, carinhoso e amigavel, que foi encontrado "
        "todo machucado, agora, vive em um lar seguro e cheio de carinho, onde recebe todo o cuidado que merece.',"
        " ('https://premierpet.com.br/wp-content/uploads/2024/08/cao-duvida-768x599.jpg');";
    await db.execute(sql);

    sql =
    "INSERT INTO HISTORIA (nome, adotado, historia, urlImage) VALUES ('Nina           30/03/2007', 'Adotada pela familia Silva', "
        "'Uma coelhinha doce e tranquila, resgatada de um ambiente difícil. Muito curiosa e carinhosa, ela adora explorar e receber atenção. Agora, encontrou um lar cheio de cuidado e amor, onde pode viver segura e feliz',"
        " ('https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/3897187267_f36b5e4e7a_c.webp?w=900&h=675');";
    await db.execute(sql);

    sql =
    "INSERT INTO HISTORIA (nome, adotado, historia, urlImage) VALUES ('Percy Jackson          28/04/2026', 'Adotado pela familia Graeco', "
        "'Um porquinho da india pequeno e muito esperto, cheio de energia e curiosidade. Adora explorar seu cantinho e brincar. Agora, vive em um lar seguro e cheio de carinho, onde recebe todo o cuidado que merece',"
        " ('https://www.petz.com.br/blog/wp-content/uploads/2024/08/porquinho-da-india-pode-comer-pessego-interna2.jpg');";
    await db.execute(sql);

    //db beatriz
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