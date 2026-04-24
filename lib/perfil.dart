import 'package:flutter/material.dart/';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Página de Perfil'
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
          centerTitle: true,
      ),
    body: ListView(
    padding: EdgeInsets.all(16),
    children: [
      Row(children: [
        CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 30),
    ),
    SizedBox(width: 10),

    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Fulado da Silva Beltrano',
    style: GoogleFonts.inter(
           fontWeight: FontWeight.bold
          fontSize: 16),
    ),
    Text(
    'fulano@email.com',
    style: TextStyle(color: Colors.grey),
          )
        ],
       )
          ],
    )
   SizedBox(height: 20),
    Text(
     'Meu histórico',
    style: GoogleFonts.inter(
       fontWeight: FontWeight.bold,
    fontSize: 18),
    ),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildHistoricoIcon(Icons.pets, "ONG'S"),
      buildHistoricoIcon(Icons.pets, "Doações"),
        ],
      )

    SizedBox(height: 20),

    Dividir(),
       buildOpcao(Icons.settings, "Configurações"),
       buildOpcao(Icons.help, "Contato com desenvolvedores"),
       buildOpcao(Icons.logout, "Sair do app"),
    )
    ],
    ),
    );
  }
}
