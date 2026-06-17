import 'package:projeto_pmo/db/db_helper.dart';
import 'package:projeto_pmo/domain/aviso.dart';
import 'package:sqflite/sqflite.dart';


class AvisoDao {
  Future<List<Aviso>> listarAvisos() async {

    Database db = await DbHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM AVISO;');

    List<Aviso> listaAvisos = [];
    for (var json in listaResult) {
      Aviso aviso = Aviso.fromJson(json);

      listaAvisos.add(aviso);
    }

    return listaAvisos;
  }
}