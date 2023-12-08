import 'package:test_app/data/entity/address_entity.dart';
import 'package:test_app/data/entity/company_entity.dart';
import 'package:test_app/domain/models/user_model.dart';

class UserEntity extends UserModel {
  UserEntity({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  Map<String, dynamic> toJson() {
    final addressEntity = address as AddressEntity;
    final companyEntity = company as CompanyEntity;
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': addressEntity.toJson(),
      'phone': phone,
      'website': website,
      'company': companyEntity.toJson(),
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
