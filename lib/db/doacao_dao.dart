import 'package:projeto_pmo/db/db_helper.dart';
import 'package:projeto_pmo/domain/doacao.dart';

class DoacaoDao {

  Future<void> inserirDoacao({
    required String ong,
    required double valor,
    required String metodoPagamento,
  }) async {

    DbHelper dbHelper = DbHelper();

    final db = await dbHelper.initDB();

    await db.insert(
      'DOACAO',
      {
        'ong': ong,
        'valor': valor,
        'metodoPagamento': metodoPagamento,
      },
    );
  }

  Future<List<Doacao>> listarDoacoes() async {

    DbHelper dbHelper = DbHelper();

    final db = await dbHelper.initDB();

    List<Map<String, dynamic>> resultado =
    await db.query(
      'DOACAO',
      orderBy: 'id DESC',
    );

    List<Doacao> lista = [];

    for (var item in resultado) {
      lista.add(Doacao.fromJson(item));
    }

    await Future.delayed(Duration(seconds: 5));
    return lista;
  }

}