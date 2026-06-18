import 'package:flutter/material.dart';
import "package:projeto_pmo/domain/propriedade.dart";
import 'package:projeto_pmo/db/propriedade_dao.dart';

class Adocao extends StatefulWidget {
  const Adocao({super.key});

  @override
  State<Adocao> createState() => _AdocaoState();
}

class _AdocaoState extends State<Adocao> {
  List<Propriedade> listaPropriedades = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaPropriedades = await PropriedadeDao().listarPropriedades();
    setState(() {
      var isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adoção"), backgroundColor: Color(0xFF8FB9E3)),
      backgroundColor: Color(0xFFBBDEFB),
      body: ListView(
      ),
    );
  }
}