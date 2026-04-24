import 'package:flutter/material.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Row(
          children: [
            Icon(
              Icons.notifications,
              color: Color(0xFF0B42A8),
              size: 30,
            ),
            SizedBox(width: 10),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  "Avisos",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B42A8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),


      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [

          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 150,
        child: ElevatedButton(
            onPressed: () {},

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            elevation: 2,
            padding: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[100],
                  shape: BoxShape.circle,
                ),

                child: Icon(Icons.pets,
                color: Colors.deepPurpleAccent,
                size: 30),
              ),

              SizedBox(width: 20),


              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Feira de Adoção",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B42A8),
                  ),
                  ),

                  SizedBox(height: 10),


                  Text("Venha conhecer e adotar bichinhos na Praça Ceci Cunha,",
                    style: TextStyle(color: Color(0xFF0B42A8)
                    ),
                  ),


                  SizedBox(height: 6),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFE3E8FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "SÁB 18/05 • 09:00",
                          style: TextStyle(
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


          //botao 2

          SizedBox(height: 10),


          SizedBox(
            width: double.infinity,
            height: 150,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  elevation: 2,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.vaccines,
                        color: Colors.red,
                        size: 30),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Campanha de Vacinação",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B42A8),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text("Vacinação gratuita para cães e gatos.",
                        style: TextStyle(color: Color(0xFF0B42A8)
                        ),
                      ),


                      SizedBox(height: 6),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFE3E8FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "DOM 03/05 • 13:00",
                              style: TextStyle(
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


          //botao 3

          SizedBox(height: 10),


          SizedBox(
            width: double.infinity,
            height: 150,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  elevation: 2,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.cleaning_services,
                        color: Colors.green,
                        size: 30),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Multirão de Limpeza no Abrigo",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B42A8),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text("Vagas limitadas para voluntários.",
                        style: TextStyle(color: Color(0xFF0B42A8)
                        ),
                      ),


                      SizedBox(height: 6),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFE3E8FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "SEX 07/05 • 10:00",
                              style: TextStyle(
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

          //botao4


          SizedBox(height: 10),


          SizedBox(
            width: double.infinity,
            height: 150,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  elevation: 2,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.set_meal,
                        color: Colors.orange,
                        size: 30),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Evento: Arrecadação de Alimentos",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B42A8),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text("Nossa ONG conta com sua colaboração.",
                        style: TextStyle(color: Color(0xFF0B42A8)
                        ),
                      ),


                      SizedBox(height: 6),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFE3E8FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "QUA 29/04 • 10:00",
                              style: TextStyle(
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

          //botao5

          SizedBox(height: 10),


          SizedBox(
            width: double.infinity,
            height: 150,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  elevation: 2,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.pets,
                        color: Colors.pink,
                        size: 30),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Feira de Adoção",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B42A8),
                          ),
                        ),

                        SizedBox(height: 10),

                        Text("Conheça o seu futuro bichinho!",
                          style: TextStyle(color: Color(0xFF0B42A8)
                          ),
                        ),


                        SizedBox(height: 6),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFE3E8FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 12,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "DOM 03/05 • 15:00",
                                style: TextStyle(
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




        ],
      ),
    );
  }
}
