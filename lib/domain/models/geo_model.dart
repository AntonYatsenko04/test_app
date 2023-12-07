// ignore_for_file: public_member_api_docs, sort_constructors_first
class GeoModel {
  final String lat;
  final String lng;

  const GeoModel({
    required this.lat,
    required this.lng,
  });

  GeoModel copyWith({
    String? lat,
    String? lng,
  }) {
    return GeoModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  String toString() => 'GeoModel(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant GeoModel other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
