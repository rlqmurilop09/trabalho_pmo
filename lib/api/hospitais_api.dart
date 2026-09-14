import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/hospital.dart';

class HospitaisApi {
  final dio = Dio();

  Future<List<Hospital>> listarHospitais() async {
    final response = await dio.get(
      'https://brasilapi.com.br/hospitais/v1',
    );

    List<Hospital> listaHospitais = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        Hospital hospital = Hospital.fromJson(json);

        listaHospitais.add(hospital);
      }
    }

    return listaHospitais;
  }
}