import 'package:dio/dio.dart';

 class CachorroApi{
   final dio = Dio();

   future<String>buscarCuriosidade()async{
     final response = await dio.get(
       'https://dogapi.dog/api/v2/facts?limit=1',
     );

     if(response.statusCode == 200){
       return response.data['data'][0]['attributes']['body'];
     }

     throw exception('Erro ao buscar curiosidade');
   }
 }