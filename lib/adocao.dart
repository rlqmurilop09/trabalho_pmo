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
      //conteudo principal, elementos
      body: ListView(
        children: [
          buildContainer(
            urlImage:
            'https://static.todamateria.com.br/upload/sh/ut/shutterstock1411747946-cke.jpg',
            nome: 'Mica',
            idade: 'Idade: 5 meses',
            genero: 'Gênero: Fêmea',
            especie: 'Espécie: Coelho',
            porte: 'Porte: Pequeno',
            raca: 'Raça: New Zealeand red',
            vacinado: 'Vacinado',
            castrado: 'Castrado',
          ),
          buildContainer(
            urlImage:
            'https://i.pinimg.com/736x/e1/f8/f0/e1f8f02350b47bc169feb4664329a898.jpg',
            nome: 'Lina',
            idade: 'Idade: 2 anos',
            genero: 'Gênero: Fêmea',
            especie: 'Espécie: Cachorro',
            porte: 'Porte: Grande',
            raca: 'Raça: SRD (Sem raça definida)',
            vacinado: 'Vacinado',
            castrado: 'Castrado',
          ),
          buildContainer(
            urlImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPyw5XkJrzCGPFjK_btUeBLGk2cWAtpmWFHg&s',
            nome: 'Hector',
            idade: 'Idade: 3 anos',
            genero: 'Gênero: Macho',
            especie: 'Especie: gato',
            porte: 'Porte: médio',
            raca: 'Raça: Persa',
            vacinado: 'Vacinado',
            castrado: 'Castrado',
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
            vacinado: 'X',
            castrado: 'Castrado',
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
    required String vacinado,
    required String castrado,
  }) {


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
            offset: Offset(4, 8),
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
          SizedBox(height: 2),
          Text(genero),
          Text(idade),
          Text(especie),
          Text(porte),
          Text(raca),
          SizedBox(height: 8),
          pin(vacina: vacinado, castrado: castrado),
        ],
      ),
    );
  }

  pin({required String vacina, required String castrado}){
    return Row(
      children: [
        Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16)
          ),

          child: Center(
            child: Text(vacina,style: TextStyle(
                fontSize: 13
            )),
          ),
        ),

        Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(16)
          ),

          child: Center(
            child: Text(castrado,style: TextStyle(
                fontSize: 13
            )),
          ),
        ),
      ],
    );
  }
}