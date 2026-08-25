import 'package:projeto_pmo/db/db_helper.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class HistoriaDao {
  Future<List<HistoriaAnimal>> listarHistorias() async {
    Database db = await DbHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM HISTORIA;');

    List<HistoriaAnimal> lista = [];
    for (var json in listaResult) {

      lista.add(HistoriaAnimal.fromJson(json));
    }

    await Future.delayed(Duration(seconds: 5));
    return lista;
  }
  }