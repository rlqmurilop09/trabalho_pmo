import 'package:flutter/material.dart';

class Doacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Row(
          children: [
            SizedBox(width: 10),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  "Selecione uma opção",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B42A8),
                  ),
                ),
              ],


            ),

          ],
        ),
      ),



      body: Column(
        children: [

          SizedBox(height: 20),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,
                height: 90,

                child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF90CAF9),
                      elevation: 5,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                  child: Row(
                    children: [
                      Icon(Icons.monetization_on,
                            size: 30,
                            color: Color(0xFF0B42A8)),

                      SizedBox(width: 15),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Doar Dinheiro",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B42A8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ),



          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: SizedBox(
              width: double.infinity,
              height: 90,

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF90CAF9),
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                child: Row(
                  children: [
                    Icon(Icons.shopping_cart,
                        size: 30,
                        color: Color(0xFF0B42A8)),

                    SizedBox(width: 15),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Doar Mantimentos",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B42A8),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}