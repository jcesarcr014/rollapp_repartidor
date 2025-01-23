import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/main.dart';
import 'package:rollapp_repartidor/widgets/ibackground4.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double windowWidth = 0.0;
  double windowHeight = 0.0;

  void _startNextScreen() =>Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void startTime() async {
    var duration = const Duration(seconds: 3);
    Timer(duration, _startNextScreen);
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _initScreen(context),
    );
  }

  Widget _initScreen(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo de la pantalla
          Container(
            color: theme.colorBackground,
          ),
          // Fondo con gradiente personalizado
          IBackground4(width: windowWidth, colorsGradient: theme.colorsGradient),
          // Contenido central de la pantalla
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "SplashLogo",
                  child: SizedBox(
                    width: windowWidth * 0.3,
                    child: Image.asset("assets/logo.png", fit: BoxFit.cover),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                CircularProgressIndicator(
                  backgroundColor: theme.colorCompanion4,
                  strokeWidth: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
