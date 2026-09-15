import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:projeto_pmo/domain/procedimento.dart";

class ContainerTuss extends StatelessWidget {

  Procedimento procedimento;

  ContainerTuss({
    super.key,
    required this.procedimento,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Color(0xFF8FB9E3),
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Color(0xFFC9D4E5),
            blurRadius: 8,
            offset: Offset(4, 8),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            'Código TUSS',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(height: 5),

          Text(
            procedimento.codigo,
            style: GoogleFonts.inter(
              fontSize: 18,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Descrição',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(height: 5),

          Text(
            procedimento.descricao,
            style: GoogleFonts.inter(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}