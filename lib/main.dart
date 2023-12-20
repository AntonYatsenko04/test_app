import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/app_themes.dart';
import 'package:test_app/core/get_it.dart';
import 'package:test_app/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final router = GetIt.I<AppRouter>();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: mainTheme(),
    );
  }
}
