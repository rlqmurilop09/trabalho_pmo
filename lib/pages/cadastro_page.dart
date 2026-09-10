import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/user_dao.dart';
import 'package:projeto_pmo/domain/user.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(32),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              
              children: [
                Text(
                  'Cadastre-se',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                SizedBox(height: 24),
                
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    hintText: 'Usuário',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                ),
                
                SizedBox(height: 12),
                
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
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

                  onPressed: cadastrar,

                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Color(0xFF90CAF9),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: Text(
                      'Voltar para o login',
                      style: TextStyle(
                        color: Color(0xFF0B42A8),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  cadastrar() async {
    String username = userController.text;
    String password = passwordController.text;


    if(username.isEmpty || password.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              'Preencha usuário e senha'
            ),
        ),
      );

        return;
    }

    User user = User(username, password);

    await UserDao().save(user);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Usuário cadastrado com sucesso!'),
      ),
    );

    Navigator.pop(context);
  }
}
