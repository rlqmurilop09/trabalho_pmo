import 'package:projeto_pmo/db/db_helper.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';
import 'package:sqflite/sqflite.dart';
class HistoriaDao {
  Future<List<HistoriaAnimal>> listarHistorias() async {
    Database db = await db_Helper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM HISTORIA;');
    List<HistoriaAnimal> lista = [];
    for (var json in listaResult) {
      HistoriaAnimal historia = HistoriaAnimal.fromJson(json);
      lista.add(historia);
    }
    return lista;
  }

  db_Helper() {}
  }