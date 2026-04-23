import 'package:flutter/material.dart';

class DoarMantimentos extends StatefulWidget {
  @override
  _DoarMantimentosState createState() => _DoarMantimentosState();
}

class _DoarMantimentosState extends State<DoarMantimentos> {
  String? ongSelecionada;
  String? tipoItem;
  TextEditingController especificacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doar mantimentos')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Título
            Text(
              'Faça uma doação',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            /// ONG
            Text('Selecione a ONG'),
            RadioListTile(
              title: Text('ONG Exemplo 1'),
              value: 'ong1',
              groupValue: ongSelecionada,
              onChanged: (value) {
                setState(() => ongSelecionada = value);
              },
            ),
            RadioListTile(
              title: Text('ONG Exemplo 2'),
              value: 'ong2',
              groupValue: ongSelecionada,
              onChanged: (value) {
                setState(() => ongSelecionada = value);
              },
            ),

            SizedBox(height: 20),

            /// Especificações
            Text('Especificações'),
            TextField(
              controller: especificacaoController,
              decoration: InputDecoration(
                hintText: 'Ex: Ração para cachorro Pedigree',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            /// Tipo de item
            Text('Tipo de mantimento'),
            RadioListTile(
              title: Text('Ração'),
              value: 'racao',
              groupValue: tipoItem,
              onChanged: (value) {
                setState(() => tipoItem = value);
              },
            ),
            RadioListTile(
              title: Text('Remédio'),
              value: 'remedio',
              groupValue: tipoItem,
              onChanged: (value) {
                setState(() => tipoItem = value);
              },
            ),

            Spacer(),

            /// Botão
            ElevatedButton(
              onPressed: () {
                print('ONG: $ongSelecionada');
                print('Especificação: ${especificacaoController.text}');
                print('Tipo: $tipoItem');
              },
              child: Text('Confirmar doação'),
            )
          ],
        ),
      ),
    );
  }
}
