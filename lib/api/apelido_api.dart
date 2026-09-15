import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/apelido.dart';

class ApelidoApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/rlqmurilop09/api-fake-pmo';

  Future<List<Apelido>> listarApelidos() async{
    final response = await dio.get('$baseUrl/apelidos');
    List<Apelido> listaApelidos = [];
    for (var json in response.data){
      Apelido apelido = Apelido.fromJson(json);
      listaApelidos.add(apelido);
    }
    await Future.delayed(Duration(seconds: 3));
    return listaApelidos;
  }
}