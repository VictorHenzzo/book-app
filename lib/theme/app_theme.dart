import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0XFFa076f2),
          onBackground: Color(0XFF555555),
          background: Color(0XFFf7f7f7),
          surface: Color(0XFFFFFFFF),
          onSurface: Color(0XFFFFFFFF),
          onPrimary: Color(0XFFFFFFFF),
          secondary: Color(0XFFFFFFFF),
          onSecondary: Color(0XFFFFFFFF),
          error: Color(0XFFFFFFFF),
          onError: Color(0XFFFFFFFF),
          brightness: Brightness.light,
        ),
      );
}
