import 'package:book_app/core/infra/service_locator/service_locator.dart';
import 'package:book_app/modules/home/navigation/home_route.dart';
import 'package:book_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeRoute.path,
      routes: {
        '/': (final context) => HomeRoute.of(),
      },
      theme: AppTheme().themeData,
    ),
  );
}

//TODO Add readme information