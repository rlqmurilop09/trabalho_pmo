import 'package:flutter/material.dart';
import 'package:projeto_pmo/api/historias_api.dart';
import 'package:projeto_pmo/api/adocao_api.dart';
import 'package:projeto_pmo/domain/historia_animal.dart';
import 'package:projeto_pmo/domain/pet_adocao.dart';
import 'package:projeto_pmo/widget/container_historia.dart';

class Historias extends StatefulWidget {
  const Historias({super.key});

  @override
  State<Historias> createState() {
    return _HistoriasState();
  }
}

class _HistoriasState extends State<Historias> {
  late Future<List<HistoriaAnimal>> futureLista;
  late Future<List<PetAdocao>> futurePets;

  @override
  void initState() {
    super.initState();

    futureLista = HistoriasApi().listarHistorias();
    futurePets = AdocaoApi().listarPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF90CAF9),
        title: const Text('Histórias dos animais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPetsAdocao(),
            buildHistorias(),
          ],
        ),
      ),
    );
  }

  Widget buildPetsAdocao() {
    return FutureBuilder<List<PetAdocao>>(
      future: futurePets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Erro ao carregar animais para adoção: ${snapshot.error}',
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Nenhum animal disponível para adoção no momento.',
            ),
          );
        }

        List<PetAdocao> listaPets = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Animais procurando uma família',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: Text(
                  'Animais disponíveis para adoção encontrados na Adoteca.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listaPets.length,
                itemBuilder: (context, index) {
                  PetAdocao pet = listaPets[index];

                  return buildCardPet(pet);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildCardPet(PetAdocao pet) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pet.imagem.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  pet.imagem,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.pets,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 10),
            Text(
              pet.nome,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text('Espécie: ${pet.especie}'),
            Text('Cidade: ${pet.cidade}'),
            const SizedBox(height: 8),
            Text(
              pet.descricao,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildHistorias() {
    return FutureBuilder<List<HistoriaAnimal>>(
      future: futureLista,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Erro ao carregar histórias: ${snapshot.error}',
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Nenhuma história encontrada.'),
          );
        }

        List<HistoriaAnimal> listaHistorias =
        snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                'Histórias de animais adotados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaHistorias.length,
              itemBuilder: (context, index) {
                return ContainerHistoria(
                  historia: listaHistorias[index],
                );
              },
            ),
          ],
        );
      },
    );
  }
}