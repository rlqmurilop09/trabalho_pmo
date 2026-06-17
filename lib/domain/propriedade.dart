
class Propriedade {
  late String urlImage;
  late String nome;
  late String idade;
  late String genero;
  late String especie;
  late String porte;
  late String raca;
  late String vacinado;
  late String castrado;

  Propriedade({
    required this.urlImage,
    required this.nome,
    required this.idade,
    required this.genero,
    required this.especie,
    required this.porte,
    required this.raca,
    required this.vacinado,
    required this.castrado,
  });
  Propriedade.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlImage'];
    nome = json['nome'];
    idade = json['idade'];
    genero = json['genero'];
    especie = json['especie'];
    porte = json['porte'];
    raca = json['raca'];
    vacinado = json['vacinado'];
    castrado = json['castrado'];
  }
}
