class Hospital {
  final int id;
  final String stateCode;
  final String city;
  final String name;
  final String address;
  final String phones;
  final String cnes;
  final List<String> treatments;
  final double lat;
  final double lng;

  Hospital({
    required this.id,
    required this.stateCode,
    required this.city,
    required this.name,
    required this.address,
    required this.phones,
    required this.cnes,
    required this.treatments,
    required this.lat,
    required this.lng,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'] ?? 0,
      stateCode: json['state_code'] ?? '',
      city: json['city'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      phones: json['phones']?.toString() ?? '',
      cnes: json['cnes']?.toString() ?? '',
      treatments: json['treatments'] != null
          ? List<String>.from(json['treatments'])
          : [],
      lat: double.tryParse(json['lat']?.toString() ?? '') ?? 0.0,
      lng: double.tryParse(json['lng']?.toString() ?? '') ?? 0.0,
    );
  }
}