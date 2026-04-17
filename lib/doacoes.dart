import 'package:flutter/material.dart';
import 'package:projeto_pmo/doacoes.dart';

class doacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PetLar"),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: Text("Adotar"),
              onPressed: () {
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Cadastrar Animal Encontrado"),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}

