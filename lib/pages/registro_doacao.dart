import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/doacao_dao.dart';
import 'package:projeto_pmo/domain/doacao.dart';
import 'package:projeto_pmo/widgets/container_doacao.dart';

class RegistroDoacao extends StatefulWidget {
  const RegistroDoacao({super.key});

  @override
  State<RegistroDoacao> createState() => _RegistroDoacaoState();
}

class _RegistroDoacaoState extends State<RegistroDoacao> {

  List<Doacao> listaDoacoes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaDoacoes = await DoacaoDao().listarDoacoes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF90CAF9),
        title: const Text(
          'Registro de Doações',
          style: TextStyle(
            color: Color(0xFF0B42A8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: listaDoacoes.length,
        itemBuilder: (context, i) {

          return ContainerDoacao(
            doacao: listaDoacoes[i],
          );

        },
      ),
    );
  }
}