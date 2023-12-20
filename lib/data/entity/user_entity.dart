import 'package:test_app/data/entity/address_entity.dart';
import 'package:test_app/data/entity/company_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressEntity address;
  final String phone;
  final String website;
  final CompanyEntity company;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      address: AddressEntity.fromJson(map['address'] as Map<String, dynamic>),
      phone: map['phone'] as String,
      website: map['website'] as String,
      company: CompanyEntity.fromJson(map['company'] as Map<String, dynamic>),
    );
  }
}
