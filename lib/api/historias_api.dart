import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';

class HistoriasApi {
  final Dio dio = Dio();

  final String baseUrl =
     'https://my-json-server.typicode.com/rlqmurilop09/api-fake-pmo';

  Future<List<HistoriaAnimal>> listarHistorias() async {
    final response = await dio.get('$baseUrl/historias');

    List<HistoriaAnimal> listaHistorias = [];

    for (var json in response.data) {
      HistoriaAnimal historia =
      HistoriaAnimal.fromJson(json);

      listaHistorias.add(historia);
    }

    return listaHistorias;
  }
}