import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/entity/company_entity.dart';

void main() {
  group('CompanyEntity', () {
    test('CompanyEntity toJson should return a valid JSON map', () {
      // Arrange
      final companyEntity = CompanyEntity(
        name: 'Test Company',
        catchPhrase: 'Test Catch Phrase',
        bs: 'Test BS',
      );

      // Act
      final json = companyEntity.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], 'Test Company');
      expect(json['catchPhrase'], 'Test Catch Phrase');
      expect(json['bs'], 'Test BS');
    });

    test('CompanyEntity fromJson should create a valid CompanyEntity instance',
        () {
      // Arrange
      final json = {
        'name': 'Test Company',
        'catchPhrase': 'Test Catch Phrase',
        'bs': 'Test BS',
      };

      // Act
      final companyEntity = CompanyEntity.fromJson(json);

      // Assert
      expect(companyEntity, isA<CompanyEntity>());
      expect(companyEntity.name, 'Test Company');
      expect(companyEntity.catchPhrase, 'Test Catch Phrase');
      expect(companyEntity.bs, 'Test BS');
    });
  });
}
