import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Historias extends StatefulWidget {
  const Historias({super.key});

  @override
  State<Historias> createState() => _HistoriasState();
}

class _HistoriasState extends State<Historias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.menu),
            hintText: 'Pesquisar',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32)
            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          buildContainer(
              urlImage: ('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?q=80&w=736&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              nome: 'mia',
              adotado: 'Pela familia Jacinto',
              dates: '10/02/2023',
              historia: 'Uma gatinha encontrada em um dia de chuva pelas ruas, docel,carinhosa e que so precisava de muito amor e carinho.A familia jacinto pode dar muito carinhgo para a nossa gatinha'
          ),
        ],
      ),
    );
  }

  Widget  buildContainer({
    required String urlImage,
    required String nome,
    required String adotado,
    required String dates,
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
                child: Image.network(urlImage, height: 450, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              )
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
              Row(children: [Icon(Icons.pets, size: 16),Text('3')]),
            ],
          ),

          Text(adotado),
          Text(dates),
          Text(historia),
        ],
      ),    );
  }
}