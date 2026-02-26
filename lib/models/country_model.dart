class Country {
  final String name;
  final String capital;
  final String region;
  final int population;
  final String flag;

  Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']?['common'] ?? 'N/A',
      capital: (json['capital'] != null && json['capital'] is List && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : 'N/A',
      region: json['region'] ?? 'N/A',
      population: json['population'] ?? 0,
      flag: json['flags']?['png'] ?? '',
    );
  }
}
