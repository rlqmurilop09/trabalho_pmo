import 'package:flutter/material.dart';

class DoarMantimentos extends StatefulWidget {
  @override
  _DoarMantimentosState createState() => _DoarMantimentosState();
}

class _DoarMantimentosState extends State<DoarMantimentos> {
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
              Icons.shopping_cart,
              color: Color(0xFF0B42A8),
              size: 30,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doe mantimentos",
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

            /// Mantimentos
            Text('Mantimento(s) a ser(em) doado(s)',
                style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),

            TextField(
              controller: valorController,
              decoration: InputDecoration(
                hintText: 'Ex.: Ração para cachorro Pedigree',
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// Tipo de mantimento
            Text('Tipo de mantimento',
                style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),

            _buildOpcao(
              titulo: 'Ração',
              valor: 'racao',
              grupo: metodoPagamento,
              onChanged: (v) => setState(() => metodoPagamento = v),
            ),
            _buildOpcao(
              titulo: 'Remédio',
              valor: 'remedio',
              grupo: metodoPagamento,
              onChanged: (v) => setState(() => metodoPagamento = v),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('ONG: $ongSelecionada');
                  print('Mantimento: ${valorController.text}');
                  print('Tipo: $metodoPagamento');
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