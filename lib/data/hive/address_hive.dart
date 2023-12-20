import 'package:hive/hive.dart';

import 'geo_hive.dart';
part 'address_hive.g.dart';

@HiveType(typeId: 1)
class AddressHive extends HiveObject {
  @HiveField(0)
  final String street;

  @HiveField(1)
  final String suite;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String zipcode;

  @HiveField(4)
  final GeoHive geo;

  AddressHive({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}
