import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_pmo/api/historias_api.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';
import 'package:projeto_pmo/widget/container_historia.dart';
import 'package:projeto_pmo/api/cachorro_api.dart';

class Historias extends StatefulWidget {
  const Historias({super.key});

  @override
  State<Historias> createState() => _HistoriasState();
}

class _HistoriasState extends State<Historias> {

  late Future<List<HistoriaAnimal>> futureLista;

  @override
  void initState() {
    super.initState();
    futureLista = HistoriasApi().listarHistorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),

      body: FutureBuilder<List<HistoriaAnimal>>(
        future: futureLista,

        builder: (context, snapshot) {

          if (snapshot.hasData) {

            List<HistoriaAnimal> listaHistorias =
                snapshot.requireData;

            return buildListView(listaHistorias);
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar histórias',
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF90CAF9),

      title: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.menu),
          hintText: 'Pesquisar',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

  buildListView(List<HistoriaAnimal> listaHistorias) {
    return ListView.builder(

      itemCount: listaHistorias.length,

      itemBuilder: (context, i) {

        return ContainerHistoria(
          historia: listaHistorias[i],
        );
      },
    );
  }
}