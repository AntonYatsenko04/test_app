import 'address_model.dart';
import 'company_model.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  AddressModel address;
  String phone;
  String website;
  CompanyModel company;

  User({
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
