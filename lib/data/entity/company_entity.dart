// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_app/domain/models/company_model.dart';

class CompanyEntity extends CompanyModel {
  CompanyEntity({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory CompanyEntity.fromMap(Map<String, dynamic> map) {
    return CompanyEntity(
      name: map['name'] as String,
      catchPhrase: map['catchPhrase'] as String,
      bs: map['bs'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyEntity.fromJson(String source) =>
      CompanyEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
