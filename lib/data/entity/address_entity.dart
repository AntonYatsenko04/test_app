import 'package:test_app/data/entity/geo_entity.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  const AddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }

  factory AddressEntity.fromJson(Map<String, dynamic> map) {
    return AddressEntity(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      geo: GeoEntity.fromJson(map['geo'] as Map<String, dynamic>),
    );
  }
}
