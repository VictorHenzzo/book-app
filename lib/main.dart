import 'package:book_app/core/infra/navigation/routes.dart';
import 'package:book_app/core/infra/service_locator/service_locator.dart';
import 'package:book_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
      theme: AppTheme().themeData,
    ),
  );
}
