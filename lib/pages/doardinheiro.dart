import 'package:flutter/material.dart';

class DoarDinheiro extends StatefulWidget {
  @override
  _DoarDinheiroState createState() => _DoarDinheiroState();
}

class _DoarDinheiroState extends State<DoarDinheiro> {
  String? ongSelecionada;
  String? metodoPagamento;
  TextEditingController valorController = TextEditingController();

  Widget _buildOpcao({
    required String titulo,
    required String valor,
    required String? grupo,
    required Function(String?) onChanged,
  }) {
    bool selecionado = grupo == valor;

    return InkWell(
      onTap: () => onChanged(valor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titulo, style: TextStyle(fontSize: 16)),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selecionado ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
                color: selecionado ? Colors.blue : Colors.transparent,
              ),
              child: selecionado
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
                  "Faça uma doação",
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


      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 25),

            /// ONG
            Text('Selecione a ONG',
                style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),

            _buildOpcao(
              titulo: 'ONG Exemplo 1',
              valor: 'ong1',
              grupo: ongSelecionada,
              onChanged: (v) => setState(() => ongSelecionada = v),
            ),
            _buildOpcao(
              titulo: 'ONG Exemplo 2',
              valor: 'ong2',
              grupo: ongSelecionada,
              onChanged: (v) => setState(() => ongSelecionada = v),
            ),

            SizedBox(height: 20),

            /// Valor
            Text('Valor a ser doado',
                style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),

            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ex.: R\$50,00',
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// Pagamento
            Text('Forma de pagamento',
                style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),

            _buildOpcao(
              titulo: 'PIX',
              valor: 'pix',
              grupo: metodoPagamento,
              onChanged: (v) => setState(() => metodoPagamento = v),
            ),
            _buildOpcao(
              titulo: 'Débito',
              valor: 'debito',
              grupo: metodoPagamento,
              onChanged: (v) => setState(() => metodoPagamento = v),
            ),
            _buildOpcao(
              titulo: 'Crédito',
              valor: 'credito',
              grupo: metodoPagamento,
              onChanged: (v) => setState(() => metodoPagamento = v),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('ONG: $ongSelecionada');
                  print('Valor: ${valorController.text}');
                  print('Pagamento: $metodoPagamento');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Confirmar doação'),
              ),
            )
          ],
        ),
      ),
    );
  }
}