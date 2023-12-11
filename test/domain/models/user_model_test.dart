import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/domain/models/company_model.dart';
import 'package:test_app/domain/models/hive/company_hive.dart';

void main() {
  group('CompanyModel', () {
    test('copyWith method returns a new instance with updated values', () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Catchphrase',
        bs: 'Business Strategy',
      );

      final updatedCompany = company.copyWith(
        name: 'XYZ Company',
        catchPhrase: 'New Catchphrase',
      );

      expect(updatedCompany.name, 'XYZ Company');
      expect(updatedCompany.catchPhrase, 'New Catchphrase');
      expect(updatedCompany.bs, 'Business Strategy');
    });

    test('toString method returns a string representation of the object', () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Catchphrase',
        bs: 'Business Strategy',
      );

      expect(company.toString(),
          'CompanyModel(name: ABC Company, catchPhrase: Catchphrase, bs: Business Strategy)');
    });

    test('equality operator returns true for equal objects', () {
      const company1 = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Catchphrase',
        bs: 'Business Strategy',
      );

      const company2 = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Catchphrase',
        bs: 'Business Strategy',
      );

      expect(company1 == company2, true);
    });

    test('hashCode getter returns the hash code of the object', () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Catchphrase',
        bs: 'Business Strategy',
      );

      final hashCode = company.hashCode;

      expect(hashCode, isA<int>());
    });
    test(
        'toHive method should return a CompanyHive instance with the same values',
        () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Lorem ipsum',
        bs: 'Dolor sit amet',
      );

      final companyHive = company.toHive();

      expect(companyHive.name, company.name);
      expect(companyHive.catchPhrase, company.catchPhrase);
      expect(companyHive.bs, company.bs);
    });

    test(
        'fromHive method should return a CompanyModel instance with values from CompanyHive',
        () {
      final companyHive = CompanyHive(
        name: 'XYZ Company',
        catchPhrase: 'Updated catch phrase',
        bs: 'Updated bs',
      );

      final company = CompanyModel.fromHive(companyHive);

      expect(company.name, companyHive.name);
      expect(company.catchPhrase, companyHive.catchPhrase);
      expect(company.bs, companyHive.bs);
    });
  });
}
