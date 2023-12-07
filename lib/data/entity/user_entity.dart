// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    final addressEntity = address as AddressEntity;
    final companyEntity = company as CompanyEntity;
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': addressEntity.toMap(),
      'phone': phone,
      'website': website,
      'company': companyEntity.toMap(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      address: AddressEntity.fromMap(map['address'] as Map<String, dynamic>),
      phone: map['phone'] as String,
      website: map['website'] as String,
      company: CompanyEntity.fromMap(map['company'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
