import 'package:projeto_pmo/db/shared_prefs.dart';
import 'package:projeto_pmo/pages/homepage.dart';
import 'package:projeto_pmo/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    bool status = await prefs.getUserStatus();
    await Future.delayed(Duration(seconds: 3));

    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
            ),
      );
    } else {
      Navigator.pushReplacement(
          context,
      MaterialPageRoute(
          builder: (context){
            return LoginPage();
          },
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B42A8),
      body: Center(
        child: Icon(Icons.pets, color: Color(0xFF90CAF9),
        ),
      ),
    );
  }
}
