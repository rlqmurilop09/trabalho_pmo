import 'package:flutter/material.dart';
import 'package:projeto_pmo/api/hospitais_api.dart';
import 'package:projeto_pmo/domain/hospital.dart';

class Hospitais extends StatefulWidget {
  const Hospitais({super.key});

  @override
  State<Hospitais> createState() => _HospitaisState();
}

class _HospitaisState extends State<Hospitais> {
  late Future<List<Hospital>> futureHospitais;

  @override
  void initState() {
    super.initState();
    futureHospitais = HospitaisApi().listarHospitais();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitais'),
        backgroundColor: const Color(0xFF8FB9E3),
      ),
      backgroundColor: const Color(0xFFBBDEFB),
      body: FutureBuilder<List<Hospital>>(
        future: futureHospitais,
        builder: (context, snapshot) {
          // Enquanto a API está carregando
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Se acontecer algum erro
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar hospitais:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          // Se a API retornar dados
          if (snapshot.hasData) {
            List<Hospital> listaHospitais = snapshot.requireData;

            if (listaHospitais.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum hospital encontrado.',
                ),
              );
            }

            return ListView.builder(
              itemCount: listaHospitais.length,

              itemBuilder: (context, i) {
                Hospital hospital = listaHospitais[i];

                return Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),

                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFC9D4E5),
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        hospital.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Cidade: ${hospital.city}',
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'Endereço: ${hospital.address}',
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'Telefone: ${hospital.phones}',
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'CNES: ${hospital.cnes}',
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'Estado: ${hospital.stateCode}',
                      ),

                      const SizedBox(height: 10),

                      if (hospital.treatments.isNotEmpty)
                        Text(
                          'Atendimentos: ${hospital.treatments.join(', ')}',
                        ),

                      const SizedBox(height: 5),

                      Text(
                        'Latitude: ${hospital.lat}',
                      ),

                      Text(
                        'Longitude: ${hospital.lng}',
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text(
              'Não foi possível carregar os hospitais.',
            ),
          );
        },
      ),
    );
  }
}