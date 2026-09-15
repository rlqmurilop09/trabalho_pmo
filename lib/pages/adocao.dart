import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/db_helper.dart';
import 'package:projeto_pmo/domain/propriedade.dart';
import 'package:projeto_pmo/db/adocao_dao.dart';
import 'package:projeto_pmo/widget/container_adocao.dart';
import 'package:projeto_pmo/widget/container_tuss.dart';
import 'package:projeto_pmo/api/tuss_api.dart';
import 'package:projeto_pmo/domain/procedimento.dart';

class Adocao extends StatefulWidget {
  const Adocao({super.key});

  @override
  State<Adocao> createState() => _AdocaoState();
}

class _AdocaoState extends State<Adocao> {

  late Future<List<dynamic>> futureCombinado;

  @override
  void initState() {
    super.initState();

    futureCombinado = Future.wait([
      AdocaoDao().listarPropriedades(),
      TussApi().listarProcedimentos(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xFFBBDEFB),
      body: FutureBuilder<List<dynamic>>(
        future: futureCombinado,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar animais:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.hasData) {
            List<Propriedade> listarPropriedades =
            (snapshot.requireData[0] as List).cast<Propriedade>();
            List<Procedimento> listarProcedimentos =
            (snapshot.requireData[1] as List).cast<Procedimento>();
            if (listarPropriedades.isEmpty)
            return buildListView(listarPropriedades, listarProcedimentos);
          }
          return const Center(child: Text('Nenhum animal encontrado.')
          );
        },
      ),
    );
  }

  buildAppBar() => AppBar(
    title: const Text("Adoção"),
    backgroundColor: const Color(0xFF8FB9E3),
  );

  buildListView(List<Propriedade> listarPropriedades, List<Procedimento> listarProcedimentos) {
    return ListView.builder(
      itemCount: listarPropriedades.length,
      itemBuilder: (context, i) {
        return ContainerAdocao(
          propriedade: listarPropriedades[i],
          procedimento: listarProcedimentos[i],
        );
      },
    );
  }
}