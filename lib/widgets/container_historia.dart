import 'package:projeto_pmo/domain/historia_animal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerHistoria extends StatelessWidget {
  final HistoriaAnimal historia;

  const ContainerHistoria({super.key, required this.historia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    historia.urlImage,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                historia.nome,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Row(
                  children: [
                    Icon(Icons.pets, size: 16),
                    Text('')
                  ]
              ),
            ],
          ),
          Text(historia.adotado, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(historia.historia),
        ],
      ),
    );
  }
}