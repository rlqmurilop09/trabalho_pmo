import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/aviso_dao.dart';
import 'package:projeto_pmo/db/shared_prefs.dart';
import 'package:projeto_pmo/pages/login_page.dart';
import 'package:projeto_pmo/domain/aviso.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  SharedPrefs prefs = SharedPrefs();
  late Future<List<Aviso>> futureLista;

  @override
  void initState(){
    super.initState();
    futureLista = AvisoDao().listarAvisos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: buildActions(),
        backgroundColor: Color(0xFF90CAF9),
      title: Row(
        children: [
          Icon(
              Icons.pets,
              color: Color(0xFF0B42A8),
              size: 30,
          ),
          SizedBox(width: 10),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Text(
                "Olá, Fulano!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B42A8),
              ),
              ),
                Text(
                  "Que bom te ver de novo!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0B42A8)
                  ),

              )
            ],
          )
        ],
      ),
      ),



      body: Column(
        children: [

          SizedBox(height: 20),

          Padding(padding: EdgeInsets.symmetric(horizontal: 16),

          child: TextField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.menu),
        hintText: 'Buscar ONGs ou locais...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Color(0xFF0B42A8), // cor da borda
            width: 2, // espessura
              ),
            ),
          ),
         ),
          ),
        SizedBox(height: 40),

          Container(
            height: 250, //  muda a altura aqui
            width: double.infinity, // ocupa toda tela

            margin: EdgeInsets.symmetric(horizontal: 16),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://www.provasbrasil.com.br/images/mapas/mapa-arapiraca-al-12.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 40),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: SizedBox(
              width: double.infinity, // ocupa toda largura
              height: 90, // altura do botão

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF90CAF9),
                  elevation: 5, // sombra

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                child: Row(
                  children: [

                    Icon(Icons.notifications,
                        size: 30, color:
                        Color(0xFF0B42A8)),

                    SizedBox(width: 15),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Avisos",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B42A8),
                          ),
                        ),
                        Text(
                          "Veja avisos recentes",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0B42A8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          Padding(padding: EdgeInsets.symmetric(horizontal: 16),

          child: SizedBox(
            width: double.infinity,
            height: 90,

            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF90CAF9),
                elevation: 5, // sombra

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              child: Row(
                children: [

                  Icon(Icons.book,
                  size: 30, color:
                  Color(0xFF0B42A8)),

               SizedBox(width: 15),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                    "Histórias",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B42A8),
                    ),
                  ),
                    Text(
                   "Conheça histórias de sucesso",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0B42A8),
                    ),
                    ),
                    ],
                  ),
                ],
              ),
             ),
            ),
          ),

         ], // Column
        ),
       );



  }

   buildActions() {
    return [
      IconButton(
          onPressed: () {
            prefs.setUserStatus(false);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder:(context){
                      return LoginPage();
                    },
                ),
            );
          },

          icon: Icon(Icons.logout),
      ),
    ];
   }
}
