import 'package:flutter/material.dart';

class Aviso {
  late String corIcone;
  late String corFundo;
  late String titulo;
  late String descricao;
  late String data;

  Aviso({
    required this.corIcone,
    required this.corFundo,
    required this.titulo,
    required this.descricao,
    required this.data,
  });



  Aviso.fromJson(Map <String, dynamic> json){
    corIcone = json['corIcone'];
    corFundo = json['corFundo'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    data = json['data'];
  }


  Color get corIconeColor =>
      Color(int.parse(corIcone.replaceFirst('#', 'FF'), radix: 16));

  Color get corFundoColor =>
      Color(int.parse(corFundo.replaceFirst('#', 'FF'), radix: 16));

}