import 'package:book_app/modules/book_details/navigation/book_details_route.dart';
import 'package:book_app/modules/home/navigation/home_route.dart';
import 'package:flutter/material.dart';

final class Routes {
  Routes._();

  static String get initialRoute => HomeRoute.path;

  static Map<String, WidgetBuilder> get routes => const {
        HomeRoute.path: HomeRoute.of,
        BookDetailsRoute.path: BookDetailsRoute.of,
      };
}
