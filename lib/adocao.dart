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
      appBar: AppBar(title: Text("Adoção"), backgroundColor: Color(0xFF8FB9E3)),

      backgroundColor: Color(0xFFBBDEFB),
      body: ListView(
        children: [
          buildContainer(
            urlImage:
            'https://static.todamateria.com.br/upload/sh/ut/shutterstock1411747946-cke.jpg',
            nome: 'Mica',
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
            urlImage:
            'https://i.pinimg.com/736x/e1/f8/f0/e1f8f02350b47bc169feb4664329a898.jpg',
            nome: 'Lina',
            idade: '2 anos',
            genero: 'Femea',
            especie: 'Especie: Cachorro',
            porte: 'Porte: Pequeno',
            raca: 'Raça: lulu da pomerania',
            vacinado: true,
            castrado: false,
            treinado: true,
          ),
          buildContainer(
            urlImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPyw5XkJrzCGPFjK_btUeBLGk2cWAtpmWFHg&s',
            nome: 'Hector',
            idade: '3 anos',
            genero: 'Macho',
            especie: 'Especie: gato',
            porte: 'Porte: médio',
            raca: 'Raça: Persa',
            vacinado: true,
            castrado: true,
            treinado: true,
          ),
          buildContainer(
            urlImage:
            'https://odia.ig.com.br/_midias/jpg/2024/05/22/passaros_domesticos-32914698.jpg',
            nome: 'Pepita',
            idade: '1 anos',
            genero: 'Femea',
            especie: 'Especie: Ave',
            porte: 'Porte: Pequeno',
            raca: 'Raça: Calopsita',
            vacinado: false,
            castrado: false,
            treinado: false,
          ),
        ],
      ),
    );
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
  }) {
    Widget({
      required IconData icone,
      required String titulo,
      required String subtitulo,
    }) {}
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8FB9E3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC9D4E5),
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(
                  urlImage,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text('ONG: Patinha feliz '),
                  Icon(Icons.pets, size: 20),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),

          Wrap(
            spacing: 4,
            children: [
              // Text(idade),
              // Text(genero),
              // Text(especie),
              // Text(porte),
              // Text(raca),
              //
              // Text('Vacinado: ${vacinado ? "sim" : "não"}'),
              // Text('Castrado: ${castrado ? "sim" : "não"}'),
              // Text('Treinado: ${treinado ? "sim" : "não"}'),
              buildChip('Vacinado', Colors.lightBlueAccent.shade100, Colors.blue),
              buildChip('Vacinado', Colors.lightBlueAccent.shade100, Colors.blue),
              buildChip('Vacinado', Colors.lightBlueAccent.shade100, Colors.blue),
              buildChip('Vacinado', Colors.lightBlueAccent.shade100, Colors.blue),
              buildChip('Vacinado', Colors.lightBlueAccent.shade100, Colors.blue),
              Chip(
                label: Text('Treinado', style: TextStyle(color: Colors.green)),
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                backgroundColor: Colors.greenAccent.shade100,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
  
  buildChip(String text, Color backgroundColor, Color textColor){
    return Chip(
      label: Text(text, style: TextStyle(color: textColor)),
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
    );
  }

}
