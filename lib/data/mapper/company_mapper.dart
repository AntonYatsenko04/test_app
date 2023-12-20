import 'package:test_app/data/entity/company_entity.dart';
import 'package:test_app/domain/models/company_model.dart';

import '../hive/company_hive.dart';

abstract class CompanyMapper {
  static CompanyHive toHive(CompanyEntity company) {
    return CompanyHive(
      name: company.name,
      catchPhrase: company.catchPhrase,
      bs: company.bs,
    );
  }

  static CompanyEntity fromHive(CompanyHive company) {
    return CompanyEntity(
        name: company.name, catchPhrase: company.catchPhrase, bs: company.bs);
  }

  static CompanyEntity modelToEntity(CompanyModel company) {
    return CompanyEntity(
        name: company.name, catchPhrase: company.catchPhrase, bs: company.bs);
  }

  static CompanyModel entityToModel(CompanyEntity company) {
    return CompanyModel(
        name: company.name, catchPhrase: company.catchPhrase, bs: company.bs);
  }
}
