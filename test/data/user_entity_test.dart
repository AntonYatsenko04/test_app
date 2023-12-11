import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/entity/address_entity.dart';
import 'package:test_app/data/entity/company_entity.dart';
import 'package:test_app/data/entity/geo_entity.dart';
import 'package:test_app/data/entity/user_entity.dart';

void main() {
  group('UserEntity', () {
    test('toJson should return a valid JSON map', () {
      // Arrange
      final userEntity = UserEntity(
        id: 1,
        name: 'John Doe',
        username: 'johndoe',
        email: 'john.doe@example.com',
        address: AddressEntity(
          street: '123 Main St',
          suite: 'Apt 4',
          city: 'New York',
          zipcode: '12345',
          geo: GeoEntity(
            lat: '40.7128',
            lng: '-74.0060',
          ),
        ),
        phone: '1234567890',
        website: 'www.example.com',
        company: CompanyEntity(
          name: 'Example Company',
          catchPhrase: 'Catchy phrase',
          bs: 'Business strategy',
        ),
      );

      // Act
      final jsonMap = userEntity.toJson();

      // Assert
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['id'], equals(1));
      expect(jsonMap['name'], equals('John Doe'));
      expect(jsonMap['username'], equals('johndoe'));
      expect(jsonMap['email'], equals('john.doe@example.com'));
      expect(jsonMap['address'], isA<Map<String, dynamic>>());
      expect(jsonMap['address']['street'], equals('123 Main St'));
      expect(jsonMap['address']['suite'], equals('Apt 4'));
      expect(jsonMap['address']['city'], equals('New York'));
      expect(jsonMap['address']['zipcode'], equals('12345'));
      expect(jsonMap['address']['geo'], isA<Map<String, dynamic>>());
      expect(jsonMap['address']['geo']['lat'], equals('40.7128'));
      expect(jsonMap['address']['geo']['lng'], equals('-74.0060'));
      expect(jsonMap['phone'], equals('1234567890'));
      expect(jsonMap['website'], equals('www.example.com'));
      expect(jsonMap['company'], isA<Map<String, dynamic>>());
      expect(jsonMap['company']['name'], equals('Example Company'));
      expect(jsonMap['company']['catchPhrase'], equals('Catchy phrase'));
      expect(jsonMap['company']['bs'], equals('Business strategy'));
    });

    test('fromJson should create a UserEntity instance from a JSON map', () {
      // Arrange
      final jsonMap = {
        'id': 1,
        'name': 'John Doe',
        'username': 'johndoe',
        'email': 'john.doe@example.com',
        'address': {
          'street': '123 Main St',
          'suite': 'Suite 456',
          'city': 'City',
          'zipcode': '12345',
          'geo': {'lat': '12.3456', 'lng': '78.9012'},
        },
        'phone': '1234567890',
        'website': 'www.example.com',
        'company': {
          'name': 'ACME Inc',
          'catchPhrase': 'Making the world a better place',
          'bs': 'Software Development',
        },
      };

      // Act
      final userEntity = UserEntity.fromJson(jsonMap);

      // Assert
      expect(userEntity, isA<UserEntity>());
      expect(userEntity.id, equals(1));
      expect(userEntity.name, equals('John Doe'));
      expect(userEntity.username, equals('johndoe'));
      expect(userEntity.email, equals('john.doe@example.com'));

      expect(userEntity.address, isA<AddressEntity>());
      expect(userEntity.address.street, equals('123 Main St'));
      expect(userEntity.address.suite, equals('Suite 456'));
      expect(userEntity.address.city, equals('City'));
      expect(userEntity.address.zipcode, equals('12345'));
      expect(userEntity.address.geo, isA<GeoEntity>());
      expect(userEntity.address.geo.lat, equals('12.3456'));
      expect(userEntity.address.geo.lng, equals('78.9012'));

      expect(userEntity.phone, equals('1234567890'));
      expect(userEntity.website, equals('www.example.com'));
      expect(userEntity.company, isA<CompanyEntity>());
      expect(userEntity.company.name, equals('ACME Inc'));
      expect(userEntity.company.catchPhrase,
          equals('Making the world a better place'));
      expect(userEntity.company.bs, equals('Software Development'));
    });
  });
}
