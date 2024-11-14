import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/config/theme.dart';
import 'package:rollapp_repartidor/router/app_routes.dart';

AppThemeData theme = AppThemeData();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Aquí puedes manejar la lógica cuando la aplicación está en segundo plano
  print('Handling a background message: ${message.messageId}');
}

  void _listenToMessages() {
    // 2do Plano
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Manejar mensajes cuando la aplicación está cerrada
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new message was opened: ${message.messageId}');
    });
  }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _listenToMessages();
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