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
  // List<Propriedade> listaPropriedades = [];
  late Future<List<Propriedade>> futureLista;

  @override
  void initState() {
    super.initState();
    futureLista = AdocaoDao().listarPropriedades();
  }
  // loadData() async {
  //  futureLista = AdocaoDao().listarPropriedades();
  // setState(() {});
 // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFFBBDEFB),
      body: FutureBuilder(
          future: futureLista,

          builder: (context, snapshot){

            if (snapshot.hasData){
              List<Propriedade> listarPropriedades = snapshot.requireData;
              return buildListView(listarPropriedades);
            }
            return Center (child: CircularProgressIndicator());
       },
      )
    );
  }

  buildAppBar() => AppBar(
      title: Text("Adoção"),
      backgroundColor: Color(0xFF8FB9E3)
  );

   buildListView(List<Propriedade> listarPropriedades) {
    return ListView.builder(
      itemCount: listarPropriedades.length,
      itemBuilder: (context, i) {
        return ContainerAdocao(propriedade: listarPropriedades[i]
        );
      },
    );
  }
}

