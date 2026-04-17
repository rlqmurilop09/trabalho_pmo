import 'package:flutter/material.dart';

class Encontrar extends StatefulWidget {
  const Encontrar({super.key});

  @override
  State<Encontrar> createState() => _EncontrarState();
}

class _EncontrarState extends State<Encontrar> {
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
              child: Text("Adotar animal resgatado"),
              onPressed: () {
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
                child: Text("Cadastrar animal encontrado"),
                onPressed: () {
          },
            ),
          ],
        ),
      ),
    );
  }
}

