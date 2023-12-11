import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/domain/models/company_model.dart';
import 'package:test_app/domain/models/hive/company_hive.dart';

void main() {
  group('CompanyModel', () {
    test(
        'copyWith method should return a new CompanyModel instance with updated values',
        () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Lorem ipsum',
        bs: 'Dolor sit amet',
      );

      final updatedCompany = company.copyWith(
        name: 'XYZ Company',
        catchPhrase: 'Updated catch phrase',
        bs: 'Updated bs',
      );

      expect(updatedCompany.name, 'XYZ Company');
      expect(updatedCompany.catchPhrase, 'Updated catch phrase');
      expect(updatedCompany.bs, 'Updated bs');
    });

    test(
        'toString method should return a string representation of the CompanyModel',
        () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Lorem ipsum',
        bs: 'Dolor sit amet',
      );

      expect(company.toString(),
          'CompanyModel(name: ABC Company, catchPhrase: Lorem ipsum, bs: Dolor sit amet)');
    });

    test(
        'equality operator should correctly compare two CompanyModel instances',
        () {
      const company1 = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Lorem ipsum',
        bs: 'Dolor sit amet',
      );

      const company2 = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Lorem ipsum',
        bs: 'Dolor sit amet',
      );

      expect(company1 == company2, true);
    });

    test(
        'hashCode getter should return a hash code based on the CompanyModel instance',
        () {
      const company = CompanyModel(
        name: 'ABC Company',
        catchPhrase: 'Lorem ipsum',
        bs: 'Dolor sit amet',
      );

      expect(company.hashCode, isA<int>());
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
