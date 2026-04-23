import 'package:flutter/material.dart';

class Doacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doações')),
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