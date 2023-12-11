import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/domain/models/geo_model.dart';
import 'package:test_app/domain/models/hive/geo_hive.dart';

void main() {
  group('GeoModel', () {
    test(
        'copyWith should return a new GeoModel with the specified fields updated',
        () {
      const geoModel = GeoModel(lat: '10.123', lng: '20.456');

      final updatedGeoModel = geoModel.copyWith(lat: '30.789');

      expect(updatedGeoModel.lat, '30.789');
      expect(updatedGeoModel.lng, '20.456');
    });

    test('toString should return a string representation of the GeoModel', () {
      const geoModel = GeoModel(lat: '10.123', lng: '20.456');

      final result = geoModel.toString();

      expect(result, 'GeoModel(lat: 10.123, lng: 20.456)');
    });

    test('equality should work correctly for GeoModel instances', () {
      const geoModel1 = GeoModel(lat: '10.123', lng: '20.456');
      const geoModel2 = GeoModel(lat: '10.123', lng: '20.456');
      const geoModel3 = GeoModel(lat: '30.789', lng: '40.987');

      expect(geoModel1, equals(geoModel2));
      expect(geoModel1, isNot(equals(geoModel3)));
    });

    test('hashCode should return a unique hash code for each GeoModel instance',
        () {
      const geoModel1 = GeoModel(lat: '10.123', lng: '20.456');
      const geoModel2 = GeoModel(lat: '10.123', lng: '20.456');
      const geoModel3 = GeoModel(lat: '30.789', lng: '40.987');

      expect(geoModel1.hashCode, equals(geoModel2.hashCode));
      expect(geoModel1.hashCode, isNot(equals(geoModel3.hashCode)));
    });

    test(
      'fromHive should return a GeoModel instance with the same lat and lng as the provided GeoHive',
      () {
        final geoHive = GeoHive(lat: '10.123', lng: '20.456');

        final geoModel = GeoModel.fromHive(geoHive);

        expect(geoModel.lat, geoHive.lat);
        expect(geoModel.lng, geoHive.lng);
      },
    );

    test(
      'toHive should return a GeoHive instance with the same lat and lng',
      () {
        const geoModel = GeoModel(lat: '10.123', lng: '20.456');

        final geoHive = geoModel.toHive();

        expect(geoHive.lat, geoModel.lat);
        expect(geoHive.lng, geoModel.lng);
      },
    );
  });
}
