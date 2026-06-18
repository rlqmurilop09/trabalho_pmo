import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:projeto_pmo/domain/propriedade.dart";

class ContainerPropriedade extends StatefulWidget {
  final Propriedade propriedade;
  const ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}
class _ContainerPropriedadeState extends State<ContainerPropriedade> {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.propriedade.urlImage,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.propriedade.nome,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text('ONG: Patinha feliz '),
                  Icon(Icons.pets, size: 20),
                ],
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(widget.propriedade.genero),
          Text(widget.propriedade.idade),
          Text(widget.propriedade.especie),
          Text(widget.propriedade.porte),
          Text(widget.propriedade.raca),
          SizedBox(height: 8),
          pin(vacina: widget.propriedade.vacinado, castrado: widget.propriedade.castrado),
        ],
      ),
    );
  }

  pin({required String vacina, required String castrado}){
    return Row(
      children: [
        Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16)
          ),

          child: Center(
            child: Text(vacina,style: TextStyle(
                fontSize: 13
            )),
          ),
        ),

        Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(16)
          ),

          child: Center(
            child: Text(castrado,style: TextStyle(
                fontSize: 13
            )),
          ),
        ),
      ],
    );
  }

}
