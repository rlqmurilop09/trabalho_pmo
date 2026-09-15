class Procedimento {
  final String codigo;
  final String descricao;

  Procedimento({
    required this.codigo,
    required this.descricao,
  });

  factory Procedimento.fromJson(Map<String, dynamic> json) {
    return Procedimento(
      codigo: json['codigo'],
      descricao: json['descricao'],
    );
  }
}