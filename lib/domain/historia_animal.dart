class HistoriaAnimal {
  int id;
  String nome;
  String adotado;
  String historia;
  String urlImage;

  HistoriaAnimal({
    required this.id,
    required this.nome,
    required this.adotado,
    required this.historia,
    required this.urlImage,
  });

  HistoriaAnimal.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        adotado = json['adotado'],
        historia = json['historia'],
        urlImage = json['urlImage'];
}