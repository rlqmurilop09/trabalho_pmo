class Apelido {
  int id;
  String nome;
  int propriedadeId;

  Apelido({
    required this.id,
    required this.nome,
    required this.propriedadeId,
  });

  factory Apelido.fromJson(Map<String, dynamic> json) {
    return Apelido(
      id: json['id'],
      nome: json['nome'],
      propriedadeId: json['propriedadeId'],
    );
  }
}