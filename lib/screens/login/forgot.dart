import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/main.dart';
import 'package:rollapp_repartidor/widgets/iappBar.dart';
import 'package:rollapp_repartidor/widgets/ibackground4.dart';
import 'package:rollapp_repartidor/widgets/ibox.dart';
import 'package:rollapp_repartidor/widgets/ibutton.dart';
import 'package:rollapp_repartidor/widgets/iinputField2.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {

  _pressSendButton() {

  }

  var windowWidth;
  var windowHeight;
  final editControllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    editControllerEmail.dispose();
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
          IBackground4(
              width: windowWidth, colorsGradient: theme.colorsGradient),
          const IAppBar(text: "", color: Colors.white),
          Center(
              child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, windowHeight * 0.1),
            width: windowWidth,
            child: _body(),
          )),
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
          child: Text("Forgot Password", // "Forgot password"
              style: theme.text20boldWhite),
        ),
        const SizedBox(
          height: 20,
        ),
        IBox(
            color: theme.colorBackgroundDialog,
            press: () {  },
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: IInputField2(
                      hint: "Correo Electronico", // "E-mail address"
                      icon: Icons.alternate_email,
                      colorDefaultText: theme.colorPrimary,
                      colorBackground: theme.colorBackgroundDialog,
                      controller: editControllerEmail,
                    )),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: IButton(
                    pressButton: _pressSendButton,
                    text: "Enviar", // SEND
                    color: theme.colorPrimary,
                    textStyle: theme.text16boldWhite,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )),
      ],
    );
  }
}
