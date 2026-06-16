import 'package:flutter/material.dart';

class Aviso {
  late IconData icone;
  late Color corIcone;
  late Color corFundo;
  late String titulo;
  late String descricao;
  late String data;

  Aviso({
    required this.icone,
    required this.corIcone,
    required this.corFundo,
    required this.titulo,
    required this.descricao,
    required this.data,
  });
}