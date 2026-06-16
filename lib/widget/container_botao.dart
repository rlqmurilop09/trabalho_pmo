import 'package:projeto_pmo/domain/aviso.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerBotao extends StatefulWidget {
  Aviso aviso;

  ContainerBotao({
    super.key,
    required this.aviso,
  });

  @override
  State<ContainerBotao> createState() => _ContainerBotaoState();
}

class _ContainerBotaoState extends State<ContainerBotao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            elevation: 2,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.aviso.corFundoIcone,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.aviso.icone,
                  color: widget.aviso.corIcone,
                  size: 30,
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.aviso.titulo,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0B42A8),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      widget.aviso.descricao,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0B42A8),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3E8FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 12,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.aviso.data,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}