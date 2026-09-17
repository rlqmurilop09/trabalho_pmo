import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/pet_adocao.dart';

class AdocaoApi {
  final Dio dio = Dio();

  final String baseUrl =
      'https://api.adoteca.com.br';

  Future<List<PetAdocao>> listarPets() async {
    final response = await dio.get(
      '$baseUrl/agents/v1/pets/search',
      queryParameters: {
        'species': 'dog',
      },
    );

    List dados = [];

    if (response.data is List) {
      dados = response.data;
    } else if (response.data['pets'] is List) {
      dados = response.data['pets'];
    } else if (response.data['data'] is List) {
      dados = response.data['data'];
    }

    List<PetAdocao> listaPets = [];

    for (var json in dados) {
      PetAdocao pet = PetAdocao.fromJson(json);

      listaPets.add(pet);
    }

    return listaPets;
  }
}