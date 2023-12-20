import 'package:test_app/data/entity/address_entity.dart';
import 'package:test_app/data/hive/address_hive.dart';
import 'package:test_app/data/mapper/geo_mapper.dart';
import 'package:test_app/domain/models/address_model.dart';

abstract class AddressMapper {
  static AddressHive toHive(AddressEntity address) {
    return AddressHive(
      street: address.street,
      suite: address.suite,
      city: address.city,
      zipcode: address.zipcode,
      geo: GeoMapper.toHive(address.geo),
    );
  }

  static AddressEntity fromHive(AddressHive addressHive) {
    return AddressEntity(
      street: addressHive.street,
      suite: addressHive.suite,
      city: addressHive.city,
      zipcode: addressHive.zipcode,
      geo: GeoMapper.fromHive(addressHive.geo),
    );
  }

  static AddressEntity modelToEntity(AddressModel address) {
    return AddressEntity(
        street: address.street,
        suite: address.suite,
        city: address.city,
        zipcode: address.zipcode,
        geo: GeoMapper.modelToEntity(address.geo));
  }

  static AddressModel entityToModel(AddressEntity address) {
    return AddressModel(
        street: address.street,
        suite: address.suite,
        city: address.city,
        zipcode: address.zipcode,
        geo: GeoMapper.entityToModel(address.geo));
  }
}
