import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          allowEnterRouteSnapshotting: false,
        ),
      },
    ),
    scaffoldBackgroundColor: Colors.orange[500],
    cardColor: Colors.orange[200],
    appBarTheme: _appBarTheme(),
    textTheme: _textTheme(),
    fontFamily: 'JosefinSans',
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
      color: Colors.orange[100], titleTextStyle: _textTheme().headlineLarge);
}

TextTheme _textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(fontSize: 40),
    headlineMedium: TextStyle(fontSize: 30),
    bodyMedium: TextStyle(fontSize: 25),
    bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
  );
}
