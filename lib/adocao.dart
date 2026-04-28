import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Adocao extends StatefulWidget {
  const Adocao({super.key});

  @override
  State<Adocao> createState() => _AdocaoState();
}

class _AdocaoState extends State<Adocao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adoção"),
        backgroundColor: Color(0xFF8FB9E3),
      ),

      backgroundColor: Color(0xFFBBDEFB),
      body: ListView(
        children: [
          buildContainer(
            urlImage: 'https://static.todamateria.com.br/upload/sh/ut/shutterstock1411747946-cke.jpg',
            nome: 'Mica' ,
            idade: '5 meses',
            genero: 'Femea',
            especie: 'Especie: Coelho',
            porte: 'Porte: Pequeno',
            raca: 'Raça: New Zealeand red',
            vacinado: true,
            castrado: false,
            treinado: false,
          ),
          buildContainer(
            urlImage:'https://tudodebicho.vteximg.com.br/arquivos/lulu-da-pomerania-marrom.jpg',
            nome:'Lina' ,
            idade:'1 anos',
            genero:'Femea',
            especie:'Especie: Cachorro',
            porte:'Porte: Pequeno',
            raca:'Raça: lulu da pomerania',
            vacinado: true,
            castrado:false,
            treinado: true,
          ),
          buildContainer(
            urlImage:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPyw5XkJrzCGPFjK_btUeBLGk2cWAtpmWFHg&s',
            nome:'Hector' ,
            idade:'3 anos',
            genero:'Macho',
            especie:'Especie: gato',
            porte:'Porte: médio',
            raca:'Raça: Persa',
            vacinado: true,
            castrado: true,
            treinado: true,
          ),
          buildContainer(
            urlImage:'https://odia.ig.com.br/_midias/jpg/2024/05/22/passaros_domesticos-32914698.jpg',
            nome:'Pepita' ,
            idade:'1 anos',
            genero:'Femea',
            especie:'Especie: Ave',
            porte:'Porte: Pequeno',
            raca:'Raça: Calopsita',
            vacinado: false,
            castrado: false,
            treinado: false,
          ),
        ],
      ),

    );
  }
}
buildContainer({
  required String urlImage,
  required String nome,
  required String idade,
  required String genero,
  required String especie,
  required String porte,
  required String raca,
  required bool vacinado,
  required bool castrado,
  required bool treinado,
}){

  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20 ),
      decoration: BoxDecoration(
          color: Color(0xFF8FB9E3),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFC9D4E5),
              blurRadius: 8,
              offset: Offset(2, 4),
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(urlImage, height: 400,width: double.infinity, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ],
          ),

          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nome,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(children: [Text('ONG: Patinha feliz '), Icon(Icons.pets, size: 20)]),
            ],
          ),
          Text(idade),
          Text(genero),
          Text(especie),
          Text(porte),
          Text(raca),
          Text('Vacinado: ${vacinado ? "sim" : "não"}'),
          Text('Castrado: ${castrado ? "sim" : "não"}'),
          Text('Treinado: ${treinado ? "sim" : "não"}'),
        ],
      )

  );
}

