import 'package:flutter/material.dart';
import "package:projeto_pmo/domain/propriedade.dart";
import 'package:projeto_pmo/db/adocao_dao.dart';
import 'package:projeto_pmo/widget/container_adocao.dart';


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
    listaPropriedades = await AdocaoDao().listarPropriedades();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFFBBDEFB),
      body: buildListView(),

    );
  }

  AppBar buildAppBar() => AppBar(title: Text("Adoção"), backgroundColor: Color(0xFF8FB9E3));

   buildListView() {
    return ListView.builder(
      itemCount: listaPropriedades.length,
      itemBuilder: (context, i) {
        return ContainerAdocao(propriedade: listaPropriedades[i]
        );
      },
    );
  }
}

