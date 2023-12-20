class GeoEntity {
  final String lat;
  final String lng;

  const GeoEntity({
    required this.lat,
    required this.lng,
  });

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
