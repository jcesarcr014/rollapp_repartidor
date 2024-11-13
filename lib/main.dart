import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/config/theme.dart';
import 'package:rollapp_repartidor/router/app_routes.dart';

AppThemeData theme = AppThemeData();

void main() {
  theme.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var _theme = ThemeData(
      fontFamily: 'Raleway',
      primarySwatch: theme.primarySwatch,
    );

    if (theme.darkMode) {
      _theme = ThemeData(
        fontFamily: 'Raleway',
        brightness: Brightness.dark,
        unselectedWidgetColor: Colors.white,
        primarySwatch: theme.primarySwatch,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RollApp Repartidor',
      theme: _theme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}