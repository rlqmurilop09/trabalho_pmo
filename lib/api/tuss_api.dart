import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/procedimento.dart';

class TussApi {
  final dio = Dio();

  Future<List<Procedimento>> listarProcedimentos() async {
    final response = await dio.get(
      'https://brasilapi.com.br/api/tuss/v1',
    );

    List<Procedimento> listaProcedimentos = [];

    if (response.statusCode == 200) {
      if (response.data is List) {
        for (var json in response.data) {
          Procedimento procedimento = Procedimento.fromJson(json);
          listaProcedimentos.add(procedimento);
        }
      }
    }
    return listaProcedimentos;
  }
}