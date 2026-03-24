import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaDoacao(),
    );
  }
}

class TelaDoacao extends StatefulWidget {
  @override
  _TelaDoacaoState createState() => _TelaDoacaoState();
}

class _TelaDoacaoState extends State<TelaDoacao> {
  String? tipoDoacao; // controla qual opção foi escolhida

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faça uma doação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // aqui decidimos o que mostrar
        child: tipoDoacao == null
            ? telaEscolha() // primeira tela
            : telaFormulario(), // depois da escolha
      ),
    );
  }

  // 🔹 TELA INICIAL (Dinheiro ou Mantimentos)
  Widget telaEscolha() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "Como você deseja ajudar?",
          style: TextStyle(fontSize: 20),
        ),

        SizedBox(height: 30),

        ElevatedButton(
          onPressed: () {
            setState(() {
              tipoDoacao = "dinheiro";
            });
          },
          child: Text("💵 Doar Dinheiro"),
        ),

        SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            setState(() {
              tipoDoacao = "mantimentos";
            });
          },
          child: Text("🥫 Doar Mantimentos"),
        ),
      ],
    );
  }

  // 🔹 FORMULÁRIO (depois da escolha)
  Widget telaFormulario() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // botão para voltar
          TextButton(
            onPressed: () {
              setState(() {
                tipoDoacao = null;
              });
            },
            child: Text("← Alterar tipo de doação"),
          ),

          SizedBox(height: 10),

          Text(
            "Selecione a ONG",
            style: TextStyle(fontSize: 18),
          ),

          CheckboxListTile(
            title: Text("ONG Exemplo 1"),
            value: true,
            onChanged: (value) {},
          ),

          CheckboxListTile(
            title: Text("ONG Exemplo 2"),
            value: false,
            onChanged: (value) {},
          ),

          SizedBox(height: 20),

          // 🔁 Conteúdo muda dependendo da escolha
          if (tipoDoacao == "dinheiro") ...[
            Text("Valor da doação"),

            TextField(
              decoration: InputDecoration(
                hintText: "Ex: R\$50,00",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Text("Forma de pagamento"),

            CheckboxListTile(
              title: Text("PIX"),
              value: true,
              onChanged: (value) {},
            ),

            CheckboxListTile(
              title: Text("Débito"),
              value: false,
              onChanged: (value) {},
            ),

            CheckboxListTile(
              title: Text("Crédito"),
              value: false,
              onChanged: (value) {},
            ),
          ],

          if (tipoDoacao == "mantimentos") ...[
            Text("Tipo de mantimento"),

            CheckboxListTile(
              title: Text("Ração"),
              value: false,
              onChanged: (value) {},
            ),

            CheckboxListTile(
              title: Text("Medicamentos"),
              value: false,
              onChanged: (value) {},
            ),

            CheckboxListTile(
              title: Text("Cobertores"),
              value: false,
              onChanged: (value) {},
            ),

            SizedBox(height: 20),

            Text("Descrição"),

            TextField(
              decoration: InputDecoration(
                hintText: "Ex: 2 sacos de ração",
                border: OutlineInputBorder(),
              ),
            ),
          ],

          SizedBox(height: 30),

          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Confirmar doação"),
            ),
          ),
        ],
      ),
    );
  }
}