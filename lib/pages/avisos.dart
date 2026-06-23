import 'package:flutter/material.dart';
import 'package:projeto_pmo/db/aviso_dao.dart';
import 'package:projeto_pmo/domain/aviso.dart';
import 'package:projeto_pmo/widgets/container_botao.dart';

class Avisos extends StatefulWidget {
  const Avisos({super.key});

  @override
  State<Avisos> createState() => _AvisosState();
}

class _AvisosState extends State<Avisos> {

  List<Aviso> listaAvisos = [];
  AvisoDao avisoDao = AvisoDao();


  @override
  void initState() {
    super.initState();
    carregarAvisos();
  }

  carregarAvisos() async {
    listaAvisos = await avisoDao.listarAvisos();
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF90CAF9),
          title: Row(
            children: [
              Icon(
                Icons.notifications,
                color: Color(0xFF0B42A8),
                size: 30,
              ),
              SizedBox(width: 10),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    "Avisos",
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

        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: listaAvisos.length,
          itemBuilder: (context, i) {
            return ContainerBotao(aviso: listaAvisos[i]);
          },
        )

    );
  }
}