import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:projeto_pmo/domain/propriedade.dart";


class ContainerAdocao extends StatefulWidget {


  Propriedade propriedade;
  String imagemApi;


  ContainerAdocao({
    super.key,
    required this.propriedade,
    required this.imagemApi,
  });


  @override
  State<ContainerAdocao> createState() => _ContainerAdocaoState();
}


class _ContainerAdocaoState extends State<ContainerAdocao> {


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


          // IMAGEM DO BANCO DE DADOS
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.propriedade.urlImage,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),


          const SizedBox(height: 4),


          // NOME E ONG
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


                  Icon(
                    Icons.pets,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),


          SizedBox(height: 2),


          // INFORMAÇÕES DO ANIMAL
          Text(widget.propriedade.genero),
          Text(widget.propriedade.idade),
          Text(widget.propriedade.especie),
          Text(widget.propriedade.porte),
          Text(widget.propriedade.raca),


          SizedBox(height: 8),


          // VACINADO E CASTRADO
          pin(
            vacina: widget.propriedade.vacinado,
            castrado: widget.propriedade.castrado,
          ),


          SizedBox(height: 16),


          const Padding(
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: Text(
              'Perdidos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          // IMAGEM DA API DOG CEO
          ClipRRect(
            borderRadius: BorderRadius.circular(12),


            child: Image.network(
              widget.imagemApi,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),




        ],
      ),
    );
  }


  pin({
    required String vacina,
    required String castrado,
  }) {


    return Row(
      children: [


        Container(
          width: 70,
          height: 25,


          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
          ),


          child: Center(
            child: Text(
              vacina,


              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ),


        Container(
          width: 70,
          height: 25,


          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(16),
          ),


          child: Center(
            child: Text(
              castrado,


              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
