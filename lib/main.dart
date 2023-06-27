import 'package:book_app/core/infra/service_locator/service_locator.dart';
import 'package:book_app/modules/home/navigation/home_route.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeRoute.path,
      routes: {
        '/': (context) => HomeRoute.of(),
      },
    ),
  );
}
