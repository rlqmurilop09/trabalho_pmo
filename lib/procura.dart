import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
class Procura extends StatefulWidget {
  const Procura({super.key});

  @override
  State<Procura> createState() => _ProcuraState();
}

class _ProcuraState extends State<Procura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Procura"),
        backgroundColor: Color(0xFF8FB9E3),

      ),
      backgroundColor: Color(0xFFBBDEFB),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            botaoCard(
              icone: Icons.pets,
              titulo: "Adoção",
              subtitulo: "Adote seu amiguinho",
            ),

            SizedBox(height: 20),

            botaoCard(
              icone: Icons.pets,
              titulo: "Animais Perdidos",
              subtitulo: "Veja animais desaparecidos",
            ),
          ],
        ),
      ),
    );
  }

  Widget botaoCard({
    required IconData icone,
    required String titulo,
    required String subtitulo,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8FB9E3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: Colors.blue[900],
            size: 28,
          ),
          SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                subtitulo,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue[900],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}