import 'package:flutter/material.dart';
import 'package:projeto_pmo/pages/doacoes.dart';
import 'package:projeto_pmo/pages/encontrar.dart';
import 'package:projeto_pmo/pages/inicio.dart';
import 'package:projeto_pmo/pages/perfil.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
  Inicio(),
  Procura(),
  Doacoes(),
  Perfil(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF90CAF9),
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xFF0B42A8),
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Encontrar'),
            BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Doações'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Perfil'
            ),

          ],
        )
    );
  }
}