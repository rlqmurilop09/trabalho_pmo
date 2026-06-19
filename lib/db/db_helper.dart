import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    String dbName = 'Historia';
    String dbPath = join(path, dbName);
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE HISTORIA (
    nome TEXT NOT NULL,
            adotado TEXT NOT NULL,
            historia TEXT NOT NULL,
            urlImage TEXT NOT NULL
        );''';
    await db.execute(sql);

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

  }
}

class database {
}