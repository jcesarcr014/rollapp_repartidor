import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/screens/login/forgot.dart';
import 'package:rollapp_repartidor/screens/login/login.dart';
import 'package:rollapp_repartidor/screens/login/registro.dart';
import 'package:rollapp_repartidor/screens/splash/splash.dart';

class AppRoutes {
  static const initialRoute = 'splash';

  static Map<String, Widget Function(BuildContext)> routes = {
    'splash': (BuildContext context) => const SplashScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'registro': (BuildContext context) => const CreateAccountScreen(),
    'forgot': (BuildContext context) => const ForgotScreen()
  };
}