import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/entity/geo_entity.dart';

void main() {
  group('GeoEntity', () {
    test('toJson should return a valid JSON map', () {
      // Arrange
      final geoEntity = GeoEntity(lat: '40.7128', lng: '-74.0060');

      // Act
      final jsonMap = geoEntity.toJson();

      // Assert
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['lat'], '40.7128');
      expect(jsonMap['lng'], '-74.0060');
    });

    test('fromJson should create a GeoEntity object from a JSON map', () {
      // Arrange
      final jsonMap = {'lat': '40.7128', 'lng': '-74.0060'};

      // Act
      final geoEntity = GeoEntity.fromJson(jsonMap);

      // Assert
      expect(geoEntity, isA<GeoEntity>());
      expect(geoEntity.lat, '40.7128');
      expect(geoEntity.lng, '-74.0060');
    });
  });
}
