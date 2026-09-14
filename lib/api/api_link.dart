import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/Dominio.dart';

class ApiLink{

  final dio = Dio();

  //requisição de url .br; se o statusCode for 200, converte json em objeto e devolve o url
  Future<Dominio> findByLink(String link) async {
    late Dominio dominio;
    final response = await dio.get('https://brasilapi.com.br/api/registrobr/v1/$link');

    if (response.statusCode == 200){
      dominio = Dominio.fromJson(response.data);
    }

    return dominio;
  }

}