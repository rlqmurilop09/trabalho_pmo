import 'package:flutter/material.dart';
import 'package:projeto_pmo/api/api_link.dart';
import 'package:projeto_pmo/api/api_doacao.dart';
import 'package:projeto_pmo/domain/doacao.dart';
import 'package:projeto_pmo/domain/Dominio.dart';
import 'package:projeto_pmo/widget/container_doacao.dart';

class RegistroDoacao extends StatefulWidget {
  const RegistroDoacao({super.key});

  @override
  State<RegistroDoacao> createState() => _RegistroDoacaoState();
}

class _RegistroDoacaoState extends State<RegistroDoacao> {

  late Future<List<Doacao>> futurelistaDoacoes;

  TextEditingController resultadoController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //futurelistaDoacoes = DoacaoDao().listarDoacoes();
    futurelistaDoacoes = ApiDoacao().listarDoacoes();

    ApiLink().findByLink('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: buildAppBar(),

      body: Column(
        children: [

          TextField(
            controller: linkController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: onPressedFindByLink,
                icon: Icon(Icons.search),
              ),
              hintText: 'Domínio',
            ),
          ),

          TextField(
            controller: resultadoController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Status',
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: futurelistaDoacoes,
              builder: (context, snapshot) {

                if(snapshot.hasData){

                  List<Doacao> listaDoacoes = snapshot.requireData;

                  return buildListView(listaDoacoes);

                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
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

  Future<void> onPressedFindByLink() async {

    String link = linkController.text;

    Dominio dominio = await ApiLink().findByLink(link);

    resultadoController.text = dominio.status;
  }
}