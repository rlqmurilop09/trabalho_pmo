import 'package:flutter/material.dart';
import 'package:projeto_pmo/api/user_api.dart';
import 'package:projeto_pmo/domain/user.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resultadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF90CAF9),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro de Usuário',
                style: TextStyle(
                  color: Color(0xFF0B42A8),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 24),

              TextField(
                controller: userController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onPressedFindUser,
                    icon: Icon(Icons.search),
                  ),
                  hintText: 'Usuário',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),

              TextField(
                controller: resultadoController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Resultado da consulta',
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  border: buildPasswordOutlineInputBorder(),
                ),
              ),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  border: buildPasswordOutlineInputBorder(),
                ),
              ),

              SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0B42A8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Voltar para Login',
                  style: TextStyle(
                    color: Color(0xFF0B42A8),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressedFindUser() async {
    String username = userController.text;

    List<User> listaUsers = await UserApi().listarUsers();

    bool encontrou = false;

    for (User user in listaUsers) {
      if (user.username == username) {
        encontrou = true;
      }
    }

    if (encontrou) {
      resultadoController.text = 'Usuário encontrado';
    } else {
      resultadoController.text = 'Usuário não encontrado';
    }
  }

  Future<void> onPressed() async {
    String username = userController.text;
    String password = passwordController.text;

    Navigator.pop(context);
  }

  OutlineInputBorder buildPasswordOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF0B42A8)),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    );
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF0B42A8)),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    );
  }
}