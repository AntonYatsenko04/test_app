import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/domain/models/address_model.dart';
import 'package:test_app/domain/models/geo_model.dart';
import 'package:test_app/domain/models/hive/address_hive.dart';
import 'package:test_app/domain/models/hive/geo_hive.dart';

void main() {
  group('AddressModel', () {
    const address = AddressModel(
      street: '123 Main St',
      suite: 'Apt 4',
      city: 'City',
      zipcode: '12345',
      geo: GeoModel(lat: '12.345', lng: '67.890'),
    );

    test('copyWith should return a new AddressModel with updated values', () {
      final updatedAddress = address.copyWith(
        street: '456 Elm St',
        suite: 'Apt 8',
      );

      expect(updatedAddress.street, '456 Elm St');
      expect(updatedAddress.suite, 'Apt 8');
      // Make sure other properties remain unchanged
      expect(updatedAddress.city, address.city);
      expect(updatedAddress.zipcode, address.zipcode);
      expect(updatedAddress.geo, address.geo);
    });

    test(
        'toString should return a formatted string representation of the AddressModel',
        () {
      final expectedString =
          'AddressModel(street: ${address.street}, suite: ${address.suite}, city: ${address.city}, zipcode: ${address.zipcode}, geo: ${address.geo})';
      expect(address.toString(), expectedString);
    });

    test('== should return true for two identical AddressModel instances', () {
      const identicalAddress = AddressModel(
        street: '123 Main St',
        suite: 'Apt 4',
        city: 'City',
        zipcode: '12345',
        geo: GeoModel(lat: '12.345', lng: '67.890'),
      );

      expect(address == identicalAddress, true);
    });

    test(
        'hashCode should return the same value for two identical AddressModel instances',
        () {
      const identicalAddress = AddressModel(
        street: '123 Main St',
        suite: 'Apt 4',
        city: 'City',
        zipcode: '12345',
        geo: GeoModel(lat: '12.345', lng: '67.890'),
      );

      expect(address.hashCode == identicalAddress.hashCode, true);
    });
    test(
        'fromHive should return an AddressModel instance with the same values as the provided AddressHive',
        () {
      final addressHive = AddressHive(
        street: '123 Main St',
        suite: 'Apt 4',
        city: 'City',
        zipcode: '12345',
        geo: GeoHive(lat: '12.345', lng: '67.890'),
      );

      final address = AddressModel.fromHive(addressHive);

      expect(address.street, addressHive.street);
      expect(address.suite, addressHive.suite);
      expect(address.city, addressHive.city);
      expect(address.zipcode, addressHive.zipcode);
      expect(address.geo.lat, addressHive.geo.lat);
      expect(address.geo.lng, addressHive.geo.lng);
    });

    test(
        'toHive should return an AddressHive instance with the same values as the AddressModel',
        () {
      const address = AddressModel(
        street: '123 Main St',
        suite: 'Apt 4',
        city: 'City',
        zipcode: '12345',
        geo: GeoModel(lat: '12.345', lng: '67.890'),
      );

      final addressHive = address.toHive();

      expect(addressHive.street, address.street);
      expect(addressHive.suite, address.suite);
      expect(addressHive.city, address.city);
      expect(addressHive.zipcode, address.zipcode);
      expect(addressHive.geo.lat, address.geo.lat);
      expect(addressHive.geo.lng, address.geo.lng);
    });
  });
}
