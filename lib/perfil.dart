import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Página de Perfil',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [

          Row(
            children: [
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
                    'Fulano da Silva Beltrano',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'fulano@email.com',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),

          SizedBox(height: 20),

          Text(
            'Meu histórico',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildHistoricoItem(Icons.pets, "ONG'S"),
              buildHistoricoItem(Icons.attach_money, "Doações"),
            ],
          ),

          SizedBox(height: 20),

          Divider(),

          buildOpcao(Icons.settings, "Configurações"),
          buildOpcao(Icons.help, "Contato com desenvolvedores"),
          buildOpcao(Icons.logout, "Sair do app"),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Doações"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }

  Widget buildHistoricoItem(IconData icon, String texto) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 40, color: Colors.blue),
        ),
        SizedBox(height: 5),
        Text(texto),
      ],
    );
  }

  Widget buildOpcao(IconData icon, String texto) {
    return ListTile(
      leading: Icon(icon),
      title: Text(texto),
      onTap: () {},
    );
  }
}