// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'hive/company_hive.dart';

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  CompanyModel copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return CompanyModel(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  String toString() =>
      'CompanyModel(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.catchPhrase == catchPhrase &&
        other.bs == bs;
  }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;

  CompanyHive toHive() {
    return CompanyHive(
      name: name,
      catchPhrase: catchPhrase,
      bs: bs,
    );
  }

  factory CompanyModel.fromHive(CompanyHive companyHive) {
    return CompanyModel(
      name: companyHive.name,
      catchPhrase: companyHive.catchPhrase,
      bs: companyHive.bs,
    );
  }
}
