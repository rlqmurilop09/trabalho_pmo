class Dominio {
  int statusCode;
  String status;
  String fqdn;
  List<String> hosts;
  String publicationStatus;
  String expiresAt;
  List<String> suggestions;

  Dominio({
    required this.statusCode,
    required this.status,
    required this.fqdn,
    required this.hosts,
    required this.publicationStatus,
    required this.expiresAt,
    required this.suggestions,
  });

  factory Dominio.fromJson(Map<String, dynamic> json) {
    return Dominio(
      statusCode: json['status_code'],
      status: json['status'],
      fqdn: json['fqdn'],
      hosts: List<String>.from(json['hosts']),
      publicationStatus: json['publication-status'],
      expiresAt: json['expires-at'],
      suggestions: List<String>.from(json['suggestions']),
    );
  }
}