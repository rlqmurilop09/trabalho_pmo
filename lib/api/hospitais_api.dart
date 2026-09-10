import 'package:dio/dio.dart';
import 'package:projeto_pmo/domain/hospital.dart';
import 'package:flutter/material.dart';

class HospitaisApi {
  final dio = Dio();

  Future<Hospital> findByCep() async {
    late Hospital hospital;
    final response = await dio.get('https://brasilapi.com.br/hospitais/v1');

    if (response.statusCode == 200) {
      hospital = Hospital.fromJson(response.data);
    }
    return hospital;
  }
}