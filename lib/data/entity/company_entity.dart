class CompanyEntity {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyEntity({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory CompanyEntity.fromJson(Map<String, dynamic> map) {
    return CompanyEntity(
      name: map['name'] as String,
      catchPhrase: map['catchPhrase'] as String,
      bs: map['bs'] as String,
    );
  }
}
