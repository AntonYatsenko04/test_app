// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_app/domain/models/geo_model.dart';

class GeoEntity extends GeoModel {
  GeoEntity({required super.lat, required super.lng});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory GeoEntity.fromMap(Map<String, dynamic> map) {
    return GeoEntity(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoEntity.fromJson(String source) =>
      GeoEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
