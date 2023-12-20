// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:test_app/domain/models/address_model.dart';
import 'package:test_app/domain/models/company_model.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  const UserModel({
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
