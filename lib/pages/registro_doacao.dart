import 'package:flutter/material.dart';
import 'package:projeto_pmo/api/api_link.dart';
import 'package:projeto_pmo/db/doacao_dao.dart';
import 'package:projeto_pmo/domain/doacao.dart';
import 'package:projeto_pmo/widget/container_doacao.dart';

class RegistroDoacao extends StatefulWidget {
  const RegistroDoacao({super.key});

  @override
  State<RegistroDoacao> createState() => _RegistroDoacaoState();
}

class _RegistroDoacaoState extends State<RegistroDoacao> {

  late Future<List<Doacao>> futurelistaDoacoes;

  @override
  void initState() {
    super.initState();
    futurelistaDoacoes = DoacaoDao().listarDoacoes();
    
    ApiLink().findByLink('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: buildAppBar(),

      body: FutureBuilder(
        future: futurelistaDoacoes,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Doacao> listaDoacoes = snapshot.requireData;
            return buildListView(listaDoacoes);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF90CAF9),
      title: const Text(
        'Registro de Doações',
        style: TextStyle(
          color: Color(0xFF0B42A8),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  buildListView(List<Doacao> listaDoacoes) {
    return ListView.builder(
      itemCount: listaDoacoes.length,
      itemBuilder: (context, i) {

        return ContainerDoacao(
          doacao: listaDoacoes[i],
        );

      },
    );
  }
}