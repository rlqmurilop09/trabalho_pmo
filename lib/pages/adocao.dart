import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/adocao_dao.dart';
import 'package:projeto_pmo/domain/propriedade.dart';
import 'package:projeto_pmo/widget/container_adocao.dart';
import 'package:projeto_pmo/api/dog_api.dart';
import 'package:projeto_pmo/pages/apelidoos.dart';

class Adocao extends StatefulWidget {
  const Adocao({super.key});


  @override
  State<Adocao> createState() => _AdocaoState();
}


class _AdocaoState extends State<Adocao> {


  late Future<List<dynamic>> futureDados;


  @override
  void initState() {
    super.initState();


    futureDados = carregarDados();
  }


  Future<List<dynamic>> carregarDados() async{
    List<Propriedade> propriedades = await AdocaoDao().listarPropriedades();
    List<String> imagens = await DogApi(). buscarImagens(propriedades.length);


    return[propriedades, imagens];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xFFBBDEFB),


      body: FutureBuilder<List<dynamic>>(
        future: futureDados,


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


            List<Propriedade> listarPropriedades = snapshot.data![0] as List<Propriedade>;


            List<String> imagensApi = snapshot.data![1] as List<String>;
            if (listarPropriedades.isNotEmpty) {
              return buildListView(
                  listarPropriedades, imagensApi);
            }
          }


          return const Center(
            child: Text('Nenhum animal encontrado.'),
          );
        },
      ),
    );
  }


  buildAppBar() => AppBar(
    title: const Text("Adoção"),
    backgroundColor: const Color(0xFF8FB9E3),

    actions: [
      IconButton(
        icon: const Icon((Icons.pets)),
        tooltip: 'Nomes',

        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Apelidos(),
            ),
          );
        },
      ),
    ],
  );


  buildListView(List<Propriedade> listarPropriedades, List<String> imagemApi) {
    return ListView.builder(
      itemCount: listarPropriedades.length,


      itemBuilder: (context, i) {
        return ContainerAdocao(
          propriedade: listarPropriedades[i],
          imagemApi: imagemApi[i],
        );
      },
    );
  }
}
