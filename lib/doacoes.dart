import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//tela concluida
class Doacoes extends StatefulWidget {
  const Doacoes({super.key});


  @override
  State<Doacoes> createState() => _DoacoesState();
}
class _DoacoesState extends State<Doacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.pets),
            hintText: 'Pesquisar',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
      ),
      body: ListView(
        children: [
          buildContainer(
            urlImage: 'https://static.todamateria.com.br/upload/sh/ut/shutterstock1411747946-cke.jpg',
            nome: 'Mica' ,
            idade: '',
            genero: 'Femea',
            especie: 'Especie: Coelho',
            porte: 'Porte: Pequeno',
            raca: 'Raça: New Zealeand red',
            vacinado: 'Vacinado: sim',
            castrado: 'Castratado: não',
            treinado: 'treinado: não',
          ),
          buildContainer(
            urlImage:'https://tudodebicho.vteximg.com.br/arquivos/lulu-da-pomerania-marrom.jpg',
            nome:'Lina' ,
            idade:'',
            genero:'Femea',
            especie:'Especie: Cachorro',
            porte:'Porte: Pequeno',
            raca:'Raça: lulu da pomerania',
            vacinado:'Vacinado: sim',
            castrado:'Castratado: não',
            treinado:'treinado: não',
          ),
          buildContainer(
            urlImage:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPyw5XkJrzCGPFjK_btUeBLGk2cWAtpmWFHg&s',
            nome:'Hector' ,
            idade:'3 anos',
            genero:'Macho',
            especie:'Especie: gato',
            porte:'Porte: médio',
            raca:'Raça: Persa',
            vacinado:'Vacinado: sim',
            castrado:'Castratado: sim',
            treinado:'treinado: não',
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
  required String vacinado,
  required String castrado,
  required String treinado,
}){
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(12),
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
              Row(children: [Text(''), Icon(Icons.pets, size: 20)]),
            ],
          ),
          Text(idade),
          Text(genero),
          Text(especie),
          Text(porte),
          Text(raca),
          Text(vacinado),
          Text(castrado),
          Text(treinado),
        ],
      )


  );
}





