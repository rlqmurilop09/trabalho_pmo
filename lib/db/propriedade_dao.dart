import 'package:sqflite/sqflite.dart';
import 'package:projeto_pmo/domain/propriedade.dart';
import 'db_helper.dart';

class PropriedadeDao{
  Future<List<Propriedade>> listarPropriedades() async {
    Database db = await DBHelper().initDB();
    var listaResult = await db.rawQuery('SELECT * FROM PROPRIEDADE;');
    List<Propriedade> listaPropriedades = [];
    for (var json in listaResult) {
      Propriedade propriedade = Propriedade.fromJson(json);
      listaPropriedades.add(propriedade);
    }
    return listaPropriedades;
  }
}
