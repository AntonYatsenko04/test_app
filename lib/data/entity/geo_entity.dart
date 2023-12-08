import 'package:test_app/domain/models/geo_model.dart';

class GeoEntity extends GeoModel {
  GeoEntity({required super.lat, required super.lng});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory GeoEntity.fromJson(Map<String, dynamic> map) {
    return GeoEntity(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }
}
