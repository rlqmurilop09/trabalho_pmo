import 'package:projeto_pmo/domain/historia_animal.dart/';
import 'package:dio/dio';

 class HistoriasApi {
   final dio = Dio();

   final barseUrl =
       'https://my-json-server.typicode.com/projeto_pmo/';

   Future<List<HistoriaAnimal>> listaHistorias() async{
     final response = await dio.get('$baseUrl/historias');

     List<HistoriaAnimal> listaHistorias = [];

     for(var json in response.data){
       HistoriaAnimal historia = HistoriaAnimal.fromJson(json);

       listaHistorias.add(historia);
     }

     return listaHistorias;
   }
 }