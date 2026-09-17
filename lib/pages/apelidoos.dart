import 'package:flutter/material.dart';
import 'package:projeto_pmo/api/apelido_api.dart';
import 'package:projeto_pmo/domain/apelido.dart';

class Apelidos extends StatefulWidget {
  const Apelidos({super.key});

  @override
  State<Apelidos> createState() => _ApelidosState();
}

class _ApelidosState extends State<Apelidos> {

  late Future<List<Apelido>> futureApelidos;

  @override
  void initState() {
    super.initState();

    futureApelidos = ApelidoApi().listarApelidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Ideias de nomes'),
        backgroundColor: const Color(0xFF8FB9E3),
      ),

      backgroundColor: const Color(0xFFBBDEFB),

      body: FutureBuilder<List<Apelido>>(
        future: futureApelidos,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar apelidos:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.hasData) {

            List<Apelido> apelidos = snapshot.data!;

            if (apelidos.isNotEmpty) {

              return ListView.builder(
                itemCount: apelidos.length,

                itemBuilder: (context, i) {

                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: const Color(0xFF8FB9E3),
                      borderRadius: BorderRadius.circular(16),

                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFC9D4E5),
                          blurRadius: 8,
                          offset: Offset(4, 8),
                        ),
                      ],
                    ),

                    child: Text(
                      apelidos[i].nome,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              );
            }
          }

          return const Center(
            child: Text('Nenhum apelido encontrado.'),
          );
        },
      ),
    );
  }
}