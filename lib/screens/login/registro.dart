import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/main.dart';
import 'package:rollapp_repartidor/providers/usuario.dart';
import 'package:rollapp_repartidor/widgets/iappBar.dart';
import 'package:rollapp_repartidor/widgets/ibackground4.dart';
import 'package:rollapp_repartidor/widgets/ibox.dart';
import 'package:rollapp_repartidor/widgets/ibutton.dart';
import 'package:rollapp_repartidor/widgets/iinputField2.dart';
import 'package:rollapp_repartidor/widgets/iinputField2Password.dart';
import 'package:rollapp_repartidor/widgets/mostrar_alerta.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  var isChecked = false;
  var isChecked2 = false;

  final editControllerName = TextEditingController();
  final editControllerApellidos = TextEditingController();
  final editControllerEmail = TextEditingController();
  final editControllerCelular = TextEditingController();
  final editControllerPassword1 = TextEditingController();
  final editControllerPassword2 = TextEditingController();

  final usuarioProvider = UsuarioProvider();

  _pressCreateAccountButton() {
    if(
      editControllerName.text.trim().isEmpty || editControllerEmail.text.trim().isEmpty || 
      editControllerPassword1.text.trim().isEmpty || editControllerCelular.text.trim().isEmpty
    ) return;
    if (editControllerPassword1.text == editControllerPassword2.text) {
      setState(() {
        isLoading = true;
      });

      usuarioProvider.registro(
        name: editControllerName.text, email: editControllerEmail.text, 
        password: editControllerPassword1.text, phone: editControllerCelular.text
      ).then((value) {
        if(value.estatus == 1) {
          Navigator.pushNamedAndRemoveUntil(context, 'login', (rooute) => false);
        } else {
          mostrarAlerta(context, 'Error', value.mensaje!);
        }
      },);
    } else {
      const _titulo = 'ERROR';
      const _mensaje = 'El password no coincide';
      mostrarAlerta(context, _titulo, _mensaje);
    }
  }

  _errorAceptar() {
    mostrarAlerta(context, "ERROR", "Debes leer y aceptar los términos y condiciones");
  }

  @override
  void dispose() {
    editControllerName.dispose();
    editControllerEmail.dispose();
    editControllerPassword1.dispose();
    editControllerPassword2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var windowWidth = MediaQuery.of(context).size.width;
    var windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: theme.colorBackground,
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            )
          : Stack(
              children: <Widget>[
                IBackground4(
                    width: windowWidth, colorsGradient: theme.colorsGradient),
                const IAppBar(text: "", color: Colors.white),
                Center(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
          child: Text("Create an Account!",
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
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2(
                    hint: "Nombre",
                    type: TextInputType.name,
                    icon: Icons.account_circle,
                    colorDefaultText: theme.colorPrimary,
                    colorBackground: theme.colorBackgroundDialog,
                    controller: editControllerName,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2(
                    hint: "Apellidos", // "Login" strings.get(21)
                    type: TextInputType.name,
                    icon: Icons.account_circle,
                    colorDefaultText: theme.colorPrimary,
                    colorBackground: theme.colorBackgroundDialog,
                    controller: editControllerApellidos,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2(
                    hint: "E-mail address",
                    type: TextInputType.emailAddress,
                    icon: Icons.alternate_email,
                    colorDefaultText: theme.colorPrimary,
                    colorBackground: theme.colorBackgroundDialog,
                    controller: editControllerEmail,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2(
                    hint: "Celular", // "Celular",
                    icon: Icons.phone,
                    type: TextInputType.phone,
                    colorDefaultText: theme.colorPrimary,
                    colorBackground: theme.colorBackgroundDialog,
                    controller: editControllerCelular,
                  ),
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
                    controller: editControllerPassword1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: IInputField2Password(
                    hint: "Confirm Password",
                    icon: Icons.vpn_key,
                    colorDefaultText: theme.colorPrimary,
                    colorBackground: theme.colorBackgroundDialog,
                    controller: editControllerPassword2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: theme.colorPrimary,
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = value!;
                          setState(() {});
                        },
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Al continuar aceptas los términos",
                            style: theme.text14boldPimary,
                            overflow: TextOverflow.clip,
                            textWidthBasis: TextWidthBasis.parent,
                          ),
                          Text(
                            "y condiciones.",
                            style: theme.text14boldPimary,
                            overflow: TextOverflow.clip,
                            textWidthBasis: TextWidthBasis.parent,
                          ),
                          InkWell(
                            child: const Text(
                              "Consultalos aqui",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                              overflow: TextOverflow.clip,
                              textWidthBasis: TextWidthBasis.parent,
                            ),
                            onTap: () => launch(
                                'http://www.rollapp.com.mx/docs/repartidor.html'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: theme.colorPrimary,
                      value: isChecked2,
                      onChanged: (value) {
                        isChecked2 = value!;
                        setState(() {});
                      },
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        children: [
                          Text(
                            "Soy mayor de edad.",
                            style: theme.text14boldPimary,
                            overflow: TextOverflow.clip,
                            textWidthBasis: TextWidthBasis.parent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: IButton(
                    pressButton: (isChecked && isChecked2)
                        ? _pressCreateAccountButton
                        : _errorAceptar,
                    text: "Crear Cuenta",
                    color: theme.colorPrimary,
                    textStyle: theme.text16boldWhite,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
      ],
    );
  }
}
