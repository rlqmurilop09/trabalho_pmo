import 'package:flutter/material.dart';
import 'package:trabalho_pmo/inicio.dart';
import 'package:trabalho_pmo/historias.dart';
import 'package:trabalho_pmo/perfil.dart';
import 'package:trabalho_pmo/perdidos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key})();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
  Início();
  Historias();
  Perdidos();
  Doacoes();
  Perfil();

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
          selectedItemColor: Colors.blueAccent,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            })
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Histórias'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Perdidos'),
            BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Doações'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Perfil'
            ),

          ],
        )
    )
  }
}