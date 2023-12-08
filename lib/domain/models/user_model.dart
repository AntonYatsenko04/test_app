// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:test_app/domain/models/address_model.dart';
import 'package:test_app/domain/models/company_model.dart';

import 'hive/user_hive.dart';

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

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    AddressModel? address,
    String? phone,
    String? website,
    CompanyModel? company,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.website == website &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        company.hashCode;
  }

  UserHive toHive() {
    return UserHive(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address.toHive(),
      phone: phone,
      website: website,
      company: company.toHive(),
    );
  }

  factory UserModel.fromHive(UserHive userHive) {
    return UserModel(
      id: userHive.id,
      name: userHive.name,
      username: userHive.username,
      email: userHive.email,
      address: AddressModel.fromHive(userHive.address),
      phone: userHive.phone,
      website: userHive.website,
      company: CompanyModel.fromHive(userHive.company),
    );
  }
}
