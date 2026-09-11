import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';

class HistoriasApi {
  final dio = Dio();

  final baseUrl =
     'https://my-json-server.typicode.com/jsss2-star/historia_animais-api/animais';

  Future<List<HistoriaAnimal>> listarHistorias() async {
    final response = await dio.get('$baseUrl/animais');

    List<HistoriaAnimal> listaHistorias = [];

    for (var json in response.data) {
      HistoriaAnimal historia =
      HistoriaAnimal.fromJson(json);

      listaHistorias.add(historia);
    }

    return listaHistorias;
  }
}