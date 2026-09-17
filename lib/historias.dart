import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF90CAF9),
        title: Text(
          'Histórias dos animais',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCabecalho(),
            buildPetsAdocao(),
            buildHistoriasAdotados(),
          ],
        ),
      ),
    );
  }

  Widget buildCabecalho() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF90CAF9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Todo animal merece um lar',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Conheça animais que encontraram uma família '
                'e outros que ainda esperam por um lar.',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPetsAdocao() {
    return FutureBuilder<List<PetAdocao>>(
      future: futurePets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Não foi possível carregar os animais para adoção.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Nenhum animal disponível para adoção.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
          );
        }

        List<PetAdocao> listaPets = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTituloSecao(
                'Animais procurando uma família',
                'Animais disponíveis para adoção.',
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listaPets.length,
                itemBuilder: (context, index) {
                  return buildCardPet(listaPets[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildCardPet(PetAdocao pet) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              escolherImagem(pet),
              height: 190,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return buildImagemPadrao();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.nome,
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.pets,
                      size: 17,
                      color: Color(0xFF64A5D8),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        pet.especie,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 17,
                      color: Color(0xFF64A5D8),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        pet.cidade,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  pet.descricao,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Disponível para adoção',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3478A8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    String escolherImagem(PetAdocao pet) {
      // Imagem para o primeiro animal
      if (pet.id == 1) {
        return 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=800';
      }

      // Imagem para o segundo animal
      if (pet.id == 2) {
        return 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?w=800';
      }

      // Imagem para o terceiro animal
      if (pet.id == 3) {
        return 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=800';
      }

      // Imagem para o quarto animal
      if (pet.id == 4) {
        return 'https://images.unsplash.com/photo-1517849845537-4d257902454a?w=800';
      }

      // Imagem para o quinto animal
      if (pet.id == 5) {
        return 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=800';
      }

      // Imagem para o sexto animal
      if (pet.id == 6) {
        return 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=800';
      }

      // Imagem padrão para animais com outros IDs
      return 'https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=800';
    }

  Widget buildImagemPadrao() {
    return Container(
      height: 190,
      width: double.infinity,
      color: const Color(0xFFE3F2FD),
      child: const Center(
        child: Icon(
          Icons.pets,
          size: 70,
          color: Color(0xFF90CAF9),
        ),
      ),
    );
  }

  Widget buildHistoriasAdotados() {
    return FutureBuilder<List<HistoriaAnimal>>(
      future: futureLista,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Erro ao carregar histórias.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Nenhuma história encontrada.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
          );
        }

        List<HistoriaAnimal> listaHistorias = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTituloSecao(
                'Histórias de animais adotados',
                'Conheça animais que encontraram uma família.',
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
          ),
        );
      },
    );
  }

  Widget buildTituloSecao(String titulo, String subtitulo) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitulo,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}