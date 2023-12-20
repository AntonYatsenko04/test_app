import 'package:test_app/data/mapper/address_mapper.dart';

import '../../domain/models/user_model.dart';
import '../entity/user_entity.dart';
import '../hive/user_hive.dart';
import 'company_mapper.dart';

abstract class UserMapper {
  static UserHive toHive(UserEntity user) {
    return UserHive(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      address: AddressMapper.toHive(user.address),
      phone: user.phone,
      website: user.website,
      company: CompanyMapper.toHive(user.company),
    );
  }

  static UserEntity fromHive(UserHive user) {
    return UserEntity(
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        address: AddressMapper.fromHive(user.address),
        phone: user.phone,
        website: user.website,
        company: CompanyMapper.fromHive(user.company));
  }

  static UserModel entityToModel(UserEntity user) {
    return UserModel(
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        address: AddressMapper.entityToModel(user.address),
        phone: user.phone,
        website: user.website,
        company: CompanyMapper.entityToModel(user.company));
  }

  static UserEntity modelToEntity(UserModel user) {
    return UserEntity(
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        address: AddressMapper.modelToEntity(user.address),
        phone: user.phone,
        website: user.website,
        company: CompanyMapper.modelToEntity(user.company));
  }
}
