import 'package:flutter/material.dart';

class Doacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Row(
          children: [
            Icon(
              Icons.monetization_on,
              color: Color(0xFF0B42A8),
              size: 30,
            ),
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


            )
          ],
        ),
      ),



      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            ElevatedButton(
              child: Text('Doar dinheiro'),
              onPressed: () {
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Doar mantimentos'),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}