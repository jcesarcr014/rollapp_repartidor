import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/main.dart';
import 'package:rollapp_repartidor/widgets/ibackground4.dart';
import 'package:rollapp_repartidor/widgets/ibox.dart';
import 'package:rollapp_repartidor/widgets/ibutton.dart';
import 'package:rollapp_repartidor/widgets/iinputField2.dart';
import 'package:rollapp_repartidor/widgets/iinputField2Password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var windowWidth;
  var windowHeight;

  final editControllerName = TextEditingController();
  final editControllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    editControllerName.dispose();
    editControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: theme.colorBackground,
      body: Stack(
        children: <Widget>[
          IBackground4(width: windowWidth, colorsGradient: theme.colorsGradient),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, windowHeight * 0.1),
              width: windowWidth,
              child: _body(),
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(left: 15, right: 20),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/roll_login.png',
            )),
        const SizedBox(
          height: 20,
        ),
        IBox(
            color: theme.colorBackgroundDialog,
            press: () {

            },
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2(
                      hint: "Login", // "Login"
                      icon: Icons.alternate_email,
                      colorDefaultText: theme.colorPrimary,
                      colorBackground: theme.colorBackgroundDialog,
                      controller: editControllerName,
                      type: TextInputType.emailAddress),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2Password(
                    hint: "Password",
                    icon: Icons.vpn_key,
                    colorDefaultText: theme.colorPrimary,
                    colorBackground: theme.colorBackgroundDialog,
                    controller: editControllerPassword,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: IButton(
                    pressButton: () {},
                    text: "Iniciar Sesión",
                    color: theme.colorPrimary,
                    textStyle: theme.text16boldWhite,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'registro'),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 20),
                  child: Text(
                    "Don't have an account? Create",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: theme.text16boldWhite,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'forgot'),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Forgot password",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: theme.text16boldWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
