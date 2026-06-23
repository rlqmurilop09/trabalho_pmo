import 'package:flutter/material.dart';
import 'package:projeto_pmo/domain/doacao.dart';

class ContainerDoacao extends StatelessWidget {

  final Doacao doacao;

  const ContainerDoacao({
    super.key,
    required this.doacao,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(

        leading: const Icon(
          Icons.volunteer_activism,
          color: Colors.green,
        ),

        title: Text(
          doacao.ong,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Valor: R\$ ${doacao.valor}',
            ),

            Text(
              doacao.metodoPagamento,
            ),

          ],
        ),

        trailing: Text(
          '#${doacao.id}',
        ),

      ),
    );
  }
}