import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rollapp_repartidor/global/globals.dart';
import 'package:rollapp_repartidor/models/respuesta.dart';
import 'package:rollapp_repartidor/models/usuario.dart';

class UsuarioProvider {
  final String baseUrl = baseUrlServer;
  final respuesta = Respuesta();

  Future<Respuesta> registro({ required String name, required String email, required String password, required String phone }) async {
    final url = Uri.parse('$baseUrl/registro');
    try {
      final response = await http.post(url, body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone
      });

      final decodedData = jsonDecode(response.body);
      if(decodedData['estatus'] != 1) {
        respuesta.estatus = 0;
        respuesta.mensaje = decodedData['msg'];
      } else {
        respuesta.estatus = 1;
        respuesta.mensaje = decodedData['msg'];
      }
    } on SocketException {
      respuesta.estatus = 0;
      respuesta.mensaje = 'No tienes conexión a internet.';
    } catch (e) {
      respuesta.estatus = 0;
      respuesta.mensaje = 'Error en la petición: $e';
    }
    return respuesta;
  }

  Future<Respuesta> login(Usuario user, String pass) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final resp = await http.post(url, body: {
        'email': user.correo,
        'password': pass,
        'lat': user.latActual,
        'long': user.lngActcual,
        'token_firebase': tokenFCM
      });

      final decodedData = json.decode(resp.body);
      if(decodedData['estatus'] != 1) {
        respuesta.estatus = 0;
        respuesta.mensaje = decodedData['msg'];
      } else {
        respuesta.estatus = 1;
        respuesta.mensaje = decodedData['msg'];
      }
    } on SocketException {
      respuesta.estatus = 0;
      respuesta.mensaje = 'No tienes conexión a internet.';
    } catch (e) {
      respuesta.estatus = 0;
      respuesta.mensaje = 'Error al iniciar sesión: $e';
    }
    return respuesta;
  }

}