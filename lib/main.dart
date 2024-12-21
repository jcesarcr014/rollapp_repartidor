import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/config/theme.dart';
import 'package:rollapp_repartidor/global/globals.dart';
import 'package:rollapp_repartidor/router/app_routes.dart';

AppThemeData theme = AppThemeData();

Future<void> _generateAndSaveToken() async {
  try {
    // Generar el token FCM
    tokenFCM = (await FirebaseMessaging.instance.getToken())!;

    // Escuchar actualizaciones del token
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      tokenFCM = newToken;
      print('Token FCM actualizado: $tokenFCM');
    });
  } catch (e) {
    print('Error al generar el token FCM: $e');
  }
}


Future<void> solicitarPermisosNotificaciones() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true, 
    sound: true, 
    criticalAlert: true, 
  );

  // Verificar el estado de los permisos
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Permisos de notificaciones concedidos.');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('Permisos provisionales concedidos.');
  } else {
    print('Permisos de notificaciones denegados.');
  }
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Aquí puedes manejar la lógica cuando la aplicación está en segundo plano
  print('Handling a background message: ${message.messageId}');
}

void _listenToMessages() {
  // Manejar mensajes en segundo plano
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Manejar mensajes cuando la aplicación está en primer plano
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received a message in foreground: ${message.messageId}');
    if (message.notification != null) {
      print('Notification Title: ${message.notification!.title}');
      print('Notification Body: ${message.notification!.body}');
      // Puedes mostrar un diálogo, snackbar o manejar la notificación aquí
    }
  });

  // Manejar mensajes cuando la aplicación está cerrada y se abre
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new message was opened: ${message.messageId}');
    if (message.notification != null) {
      print('Notification Title: ${message.notification!.title}');
      print('Notification Body: ${message.notification!.body}');
      // Aquí puedes redirigir a una pantalla específica, si es necesario
    }
  });
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await solicitarPermisosNotificaciones();
  await _generateAndSaveToken();
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
      navigatorKey: navigatorKey,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}