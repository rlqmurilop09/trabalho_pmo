import 'package:dio/dio.dart';

class DogApi{

  final dio = Dio();

  Future<String> buscarImagem() async{

    late String imagem;

    final response = await dio.get(
      'https://dog.ceo/api/breeds/image/random',
    );
    if (response.statusCode == 200){
      imagem = response.data['message'];
    }
    return imagem;
  }
  Future<List<String>> buscarImagens(int quantidade) async{
    List<String> imagens = [];
    for (int i = 0; i < quantidade; i++){
      String imagem = await buscarImagem();
      imagens.add(imagem);
    }
    return imagens;
  }
}
