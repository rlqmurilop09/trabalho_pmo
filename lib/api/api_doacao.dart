import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/doacao.dart';

class ApiDoacao {

  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/rlqmurilop09/api-fake-pmo';

  Future<List<Doacao>> listarDoacoes() async {
    final response = await dio.get('$baseUrl/Doacoes');

    List<Doacao> listarDoacoes = [];
    for (var json in response.data) {

      Doacao doacao = Doacao.fromJson(json);

      listarDoacoes.add(doacao);
    }

    //await Future.delayed(Duration(seconds: 5));
    return listarDoacoes;
  }
}