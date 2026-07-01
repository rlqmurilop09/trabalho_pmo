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
  List<HistoriaAnimal> listaHistorias = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaHistorias = await HistoriaDao().listarHistorias();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.menu),
            hintText: 'Pesquisar',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFBBDEFD),

      body: ListView(
        children: [
          buildContainer(
            urlImage:
            'https://www.chumbogordo.com.br/wp-content/uploads/2022/07/pinto-pequeno-400x380.jpg',
            nome: 'Alberto            10/04/2019',
            adotado: 'Adotado pela familia Bispo',
            historia:
            'Um pintinho pequeno e cheio de energia, resgatado com muito cuidado. Curioso e alegre, ele adora explorar e ficar perto de quem cuida dele. Agora, vive em um lar seguro, cheio de carinho e atenção',
          ),
          buildContainer(
            urlImage:
            'https://i0.statig.com.br/bancodeimagens/1t/19/gk/1t19gkv4wj56sujljd2n2h97j.jpg',
            nome: 'mia              10/02/2023',
            adotado: 'Pela familia Jacinto',
            historia:
            'Uma gatinha encontrada em um dia de chuva pelas ruas, docel,carinhosa e que so precisava de muito amor e carinho.A familia jacinto pode dar muito carinhgo para a nossa gatinha',
          ),
          buildContainer(
            urlImage:
            'https://premierpet.com.br/wp-content/uploads/2024/08/cao-duvida-768x599.jpg',
            nome: 'Bob           19/03/2013',
            adotado: 'Adotado pela familia Santos',
            historia:
            'Bob um cachooro docel, carinhoso e amigavel, que foi encontrado todo machucado, agora, vive em um lar seguro e cheio de carinho, onde recebe todo o cuidado que merece.',
          ),
          buildContainer(
            urlImage:
            'https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/3897187267_f36b5e4e7a_c.webp?w=900&h=675',
            nome: 'Nina           30/03/2007',
            adotado: 'Adotada pela familia Silva',
            historia:
            'Uma coelhinha doce e tranquila, resgatada de um ambiente difícil. Muito curiosa e carinhosa, ela adora explorar e receber atenção. Agora, encontrou um lar cheio de cuidado e amor, onde pode viver segura e feliz',
          ),
          buildContainer(
            urlImage:
            'https://www.petz.com.br/blog/wp-content/uploads/2024/08/porquinho-da-india-pode-comer-pessego-interna2.jpg',
            nome: 'Percy Jackson          28/04/2026',
            adotado: 'Adotado pela familia Graeco',
            historia:
            'Um porquinho da india pequeno e muito esperto, cheio de energia e curiosidade. Adora explorar seu cantinho e brincar. Agora, vive em um lar seguro e cheio de carinho, onde recebe todo o cuidado que merece',
          ),
        ],
      ),
    );
  }

  Widget buildContainer({
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
