import 'package:flutter/material.dart';

class DoarDinheiroPage extends StatefulWidget {
  @override
  _DoarDinheiroPageState createState() => _DoarDinheiroPageState();
}

class _DoarDinheiroPageState extends State<DoarDinheiroPage> {
  String? ongSelecionada;
  String? metodoPagamento;
  TextEditingController valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doar dinheiro')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            /// Valor
            Text('Valor a ser doado'),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'R\$50,00',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            /// Pagamento
            Text('Forma de pagamento'),
            RadioListTile(
              title: Text('PIX'),
              value: 'pix',
              groupValue: metodoPagamento,
              onChanged: (value) {
                setState(() => metodoPagamento = value);
              },
            ),
            RadioListTile(
              title: Text('Débito'),
              value: 'debito',
              groupValue: metodoPagamento,
              onChanged: (value) {
                setState(() => metodoPagamento = value);
              },
            ),
            RadioListTile(
              title: Text('Crédito'),
              value: 'credito',
              groupValue: metodoPagamento,
              onChanged: (value) {
                setState(() => metodoPagamento = value);
              },
            ),

            Spacer(),

            ElevatedButton(
              onPressed: () {
                print('ONG: $ongSelecionada');
                print('Valor: ${valorController.text}');
                print('Pagamento: $metodoPagamento');
              },
              child: Text('Confirmar doação'),
            )
          ],
        ),
      ),
    );
  }
}