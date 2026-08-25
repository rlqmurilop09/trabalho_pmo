import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_pmo/db/historia_dao.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';
import 'package:projeto_pmo/widget/container_historia.dart';

class Historias extends StatefulWidget {
  const Historias({super.key});

  @override
  State<Historias> createState() => _HistoriasState();
}

class _HistoriasState extends State<Historias> {
  //List<HistoriaAnimal> listaHistorias = [];
  late Future<Historia>> ListaHistoria;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaHistorias = HistoriaDao().listarHistorias();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: buildListView()
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF90CAF9),
      title: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.menu),
          hintText: 'Pesquisar',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: listaHistorias.length,
      itemBuilder: (context,i){
        return ContainerHistoria(historia: listaHistorias[i]);
      },

    );
  }

   buildContainer({
    required String urlImage,
    required String nome,
    required String adotado,
    required String historia,
  }) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(urlImage, height: 300, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nome,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(children: [Icon(Icons.pets, size: 16), Text('')]),
            ],
          ),

          Text(adotado),
          Text(historia),
        ],
      ),
    );
  }
}
