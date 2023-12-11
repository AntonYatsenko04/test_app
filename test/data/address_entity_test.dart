import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/entity/address_entity.dart';
import 'package:test_app/data/entity/geo_entity.dart';

void main() {
  group('AddressEntity', () {
    test('toJson should return a valid JSON map', () {
      final addressEntity = AddressEntity(
        street: '123 Main St',
        suite: 'Suite 456',
        city: 'City',
        zipcode: '12345',
        geo: GeoEntity(lat: '12.3456', lng: '78.9012'),
      );

      final jsonMap = addressEntity.toJson();

      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['street'], equals('123 Main St'));
      expect(jsonMap['suite'], equals('Suite 456'));
      expect(jsonMap['city'], equals('City'));
      expect(jsonMap['zipcode'], equals('12345'));

      final geoJson = jsonMap['geo'];
      expect(geoJson, isA<Map<String, dynamic>>());
      expect(geoJson['lat'], equals('12.3456'));
      expect(geoJson['lng'], equals('78.9012'));
    });

    test('fromJson should create an AddressEntity object from a JSON map', () {
      const jsonMap = {
        'street': '123 Main St',
        'suite': 'Suite 456',
        'city': 'City',
        'zipcode': '12345',
        'geo': {'lat': '12.3456', 'lng': '78.9012'},
      };

      final addressEntity = AddressEntity.fromJson(jsonMap);

      expect(addressEntity, isA<AddressEntity>());
      expect(addressEntity.street, equals('123 Main St'));
      expect(addressEntity.suite, equals('Suite 456'));
      expect(addressEntity.city, equals('City'));
      expect(addressEntity.zipcode, equals('12345'));

      final geoEntity = addressEntity.geo;
      expect(geoEntity, isA<GeoEntity>());
      expect(geoEntity.lat, equals('12.3456'));
      expect(geoEntity.lng, equals('78.9012'));
    });
  });
}
