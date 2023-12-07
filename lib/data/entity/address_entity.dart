// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_app/data/entity/geo_entity.dart';
import 'package:test_app/domain/models/address_model.dart';

class AddressEntity extends AddressModel {
  const AddressEntity({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  Map<String, dynamic> toMap() {
    final geoEntity = geo as GeoEntity;
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geoEntity.toMap(),
    };
  }

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      geo: GeoEntity.fromMap(map['geo'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) =>
      AddressEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
