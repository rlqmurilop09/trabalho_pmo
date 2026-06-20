import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/db_helper.dart';

class DoarDinheiro extends StatefulWidget {
  @override
  _DoarDinheiroState createState() => _DoarDinheiroState();
}

class _DoarDinheiroState extends State<DoarDinheiro> {
  String? ongSelecionada;
  String? metodoPagamento;

  TextEditingController valorController = TextEditingController();

  final DbHelper dbHelper = DbHelper();

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
            Text(
              titulo,
              style: TextStyle(fontSize: 16),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selecionado ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
                color:
                selecionado ? Colors.blue : Colors.transparent,
              ),
              child: selecionado
                  ? Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
                  : null,
            )
          ],
        ),
      ),
    );
  }

  Future<void> salvarDoacao() async {
    if (ongSelecionada == null ||
        metodoPagamento == null ||
        valorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
      return;
    }

    try {
      await dbHelper.inserirDoacao(
        ong: ongSelecionada!,
        valor: double.parse(
          valorController.text.replaceAll(',', '.'),
        ),
        metodoPagamento: metodoPagamento!,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Doação registrada com sucesso!'),
        ),
      );

      setState(() {
        ongSelecionada = null;
        metodoPagamento = null;
        valorController.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar doação'),
        ),
      );

      print(e);
    }
  }

  @override
  void dispose() {
    valorController.dispose();
    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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

            // ONG
            Text(
              'Selecione a ONG',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10),

            _buildOpcao(
              titulo: 'ONG Exemplo 1',
              valor: 'ONG Exemplo 1',
              grupo: ongSelecionada,
              onChanged: (v) {
                setState(() {
                  ongSelecionada = v;
                });
              },
            ),

            _buildOpcao(
              titulo: 'ONG Exemplo 2',
              valor: 'ONG Exemplo 2',
              grupo: ongSelecionada,
              onChanged: (v) {
                setState(() {
                  ongSelecionada = v;
                });
              },
            ),

            SizedBox(height: 20),

            // Valor
            Text(
              'Valor a ser doado',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ex.: 50,00',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Forma de pagamento
            Text(
              'Forma de pagamento',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10),

            _buildOpcao(
              titulo: 'PIX',
              valor: 'PIX',
              grupo: metodoPagamento,
              onChanged: (v) {
                setState(() {
                  metodoPagamento = v;
                });
              },
            ),

            _buildOpcao(
              titulo: 'Débito',
              valor: 'Débito',
              grupo: metodoPagamento,
              onChanged: (v) {
                setState(() {
                  metodoPagamento = v;
                });
              },
            ),

            _buildOpcao(
              titulo: 'Crédito',
              valor: 'Crédito',
              grupo: metodoPagamento,
              onChanged: (v) {
                setState(() {
                  metodoPagamento = v;
                });
              },
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: salvarDoacao,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Confirmar doação',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}