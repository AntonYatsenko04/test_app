import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/domain/models/hive/company_hive.dart';
import 'package:test_app/domain/models/hive/geo_hive.dart';

import 'domain/models/hive/address_hive.dart';
import 'domain/models/hive/user_hive.dart';

void main() async {
  Hive.init(Directory.current.path);
  Hive
    ..registerAdapter(GeoHiveAdapter())
    ..registerAdapter(CompanyHiveAdapter())
    ..registerAdapter(AddressHiveAdapter())
    ..registerAdapter(UserHiveAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
