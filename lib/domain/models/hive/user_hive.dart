import 'package:hive/hive.dart';

import 'address_hive.dart';
import 'company_hive.dart';
part 'user_hive.g.dart';

@HiveType(typeId: 2)
class UserHive extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final AddressHive address;

  @HiveField(5)
  final String phone;

  @HiveField(6)
  final String website;

  @HiveField(7)
  final CompanyHive company;

  UserHive({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
}
