// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_app/domain/models/geo_model.dart';

class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  const AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}
