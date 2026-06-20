import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/db_helper.dart';

class RegistroDoacao extends StatefulWidget {
  @override
  State<RegistroDoacao> createState() => _RegistroDoacaoState();
}

class _RegistroDoacaoState extends State<RegistroDoacao> {
  final DbHelper dbHelper = DbHelper();

  List<Map<String, dynamic>> doacoes = [];

  @override
  void initState() {
    super.initState();
    carregarDoacoes();
  }

  Future<void> carregarDoacoes() async {
    List<Map<String, dynamic>> dados =
    await dbHelper.listarDoacoes();

    setState(() {
      doacoes = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF90CAF9),
        title: const Text(
          'Registro de Doações',
          style: TextStyle(
            color: Color(0xFF0B42A8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: doacoes.isEmpty
          ? const Center(
        child: Text(
          'Nenhuma doação registrada',
          style: TextStyle(fontSize: 18),
        ),
      )
          : RefreshIndicator(
        onRefresh: carregarDoacoes,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: doacoes.length,
          itemBuilder: (context, index) {
            final doacao = doacoes[index];

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const Icon(
                  Icons.volunteer_activism,
                  color: Colors.green,
                ),

                title: Text(
                  doacao['ong'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),

                    Text(
                      'Valor: R\$ ${doacao['valor']}',
                    ),

                    Text(
                      'Pagamento: ${doacao['metodoPagamento']}',
                    ),
                  ],
                ),

                trailing: Text(
                  '#${doacao['id']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}