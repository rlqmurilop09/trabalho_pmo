class PetAdocao {
  String id;
  String nome;
  String especie;
  String cidade;
  String descricao;
  String urlAdocao;
  String imagem;

  PetAdocao({
    required this.id,
    required this.nome,
    required this.especie,
    required this.cidade,
    required this.descricao,
    required this.urlAdocao,
    required this.imagem,
  });

  PetAdocao.fromJson(Map<String, dynamic> json)
      : id = json['id']?.toString() ?? '',
        nome = json['name'] ?? json['nome'] ?? 'Nome não informado',
        especie =
            json['species'] ?? json['especie'] ?? 'Espécie não informada',
        cidade = json['city'] ?? json['cidade'] ?? 'Cidade não informada',
        descricao = json['description'] ??
            json['descricao'] ??
            'Descrição não informada',
        urlAdocao = json['adoption_url'] ??
            json['adoptionUrl'] ??
            json['url'] ??
            '',
        imagem = json['image'] ??
            json['image_url'] ??
            json['photo'] ??
            '';
}