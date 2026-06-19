class HistoriaAnimal {
  late String urlImage;
  late String nome;
  late String adotado;
  late String historia;

  HistoriaAnimal({
    required this.urlImage,
    required this.nome,
    required this.adotado,
    required this.historia,
  });


  HistoriaAnimal.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    adotado = json['adotado'];
    historia = json['historia'];
    urlImage = json['urlImage'];
  }
}