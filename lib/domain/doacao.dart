class Doacao {
  int id;
  String ong;
  double valor;
  String metodoPagamento;

  Doacao({
    required this.id,
    required this.ong,
    required this.valor,
    required this.metodoPagamento,
  });

  factory Doacao.fromJson(Map<String, dynamic> json) {
    return Doacao(
      id: json['id'],
      ong: json['ong'],
      valor: json['valor'],
      metodoPagamento: json['metodoPagamento'],
    );
  }
}