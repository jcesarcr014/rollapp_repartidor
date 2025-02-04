import 'package:flutter/material.dart';
import '../screens/screens.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class AppRoutes {
  static const initialRoute = 'splash';

  static Map<String, Widget Function(BuildContext)> routes = {
    'splash': (BuildContext context) => const SplashScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'registro': (BuildContext context) => const CreateAccountScreen(),
    'forgot': (BuildContext context) => const ForgotScreen(),
    'orders': (BuildContext context) => const OrdersScreen(),
    'order': (BuildContext context) => const OrderDetailsScreen()
  };
}