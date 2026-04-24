import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            urlImage: 'https://images.unsplash.com/photo-1600804340584-c7db2eacf0bf?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            nome: 'Carmem' ,
            idade: '',
            genero: 'Femea',
            especie: 'Especie: Cachorro',
            porte: 'Porte: Pequeno',
            raca: 'Raça: Golden Retriever',
            vacinado: 'Vacinado: sim',
            castrado: 'Castratado: não',
            treinado: 'treinado: sim',
          ),
          buildContainer(
            urlImage:'https://images.unsplash.com/photo-1600804340584-c7db2eacf0bf?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            nome:'Lulu' ,
            idade:'',
            genero:'Femea',
            especie:'Especie: Cachorro',
            porte:'Porte: Grande',
            raca:'Raça: Golden Retriever',
            vacinado:'Vacinado: sim',
            castrado:'Castratado: não',
            treinado:'treinado: sim',
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
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(urlImage, height: 300, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(6),
              ),
            ],
          ),


          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nome,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(children: [Text('3 anos'), Icon(Icons.pets, size: 16)]),
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





