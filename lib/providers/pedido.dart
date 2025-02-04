import 'dart:convert';
import 'dart:io';

import 'package:rollapp_repartidor/models/pedido.dart';
import 'package:rollapp_repartidor/models/respuesta.dart';
import 'package:http/http.dart' as http;
import 'package:rollapp_repartidor/models/usuario.dart';


class PedidoProvider {
  Respuesta respuesta = Respuesta();

  Future<Respuesta> obtenerPedidos() async {
    try {
      final url = Uri.parse('http://89.117.144.61/api/repartidor/consultar-pedidos');
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${usuarioSesion.token}'
      });
      
      final decodedData = jsonDecode(response.body);
      respuesta.estatus = decodedData['estatus'];
      respuesta.mensaje = decodedData['msg'];

      pedidos.clear();
      if(respuesta.estatus == 1) {
        for(int i = 0; i < decodedData['pedidos'].length; i++) {
          final pedido = decodedData['pedidos'][i];
          pedidos.add(
            Pedido(
              id: pedido['id'],
              idCliente: pedido['id_cliente'],
              idNegocio: pedido['id_negocio'],
              idSucursal: pedido['id_sucursal'],
              idRepartidor: pedido['id_repartidor'],
              idMetodoPago: pedido['id_metodo_pago'],
              costoEnvio: pedido['costo_envio'],
              subtotal: pedido['subtotal'],
              total: pedido['total'],
              latCliente: pedido['lat_cliente'],
              longCliente: pedido['long_cliente'],
              latNegocio: pedido['lat_negocio'],
              longNegocio: pedido['long_negocio'],
              estatusActual: pedido['estatus_actual']
            )
          );
        }
      }
    } on SocketException {
      respuesta.estatus = 0;
      respuesta.mensaje = 'No tienes conexión a internet.';
    } catch(e) {
      respuesta.estatus = 0;
      respuesta.mensaje = 'Error en la petición: $e';
    }

    return respuesta;
  }

  Future<Respuesta> obtenerPedido(int idPedido) async {
    try {
      final url = Uri.parse('http://89.117.144.61/api/repartidor/consultar-pedido/$idPedido');
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${usuarioSesion.token}'
      });
      
      final decodedData = jsonDecode(response.body);
      respuesta.estatus = decodedData['estatus'];
      respuesta.mensaje = decodedData['msg'];

      if(respuesta.estatus == 1) {
        final pedido = decodedData['pedido'];
        pedidoActual = Pedido(
          id: pedido['id'],
          idCliente: pedido['id_cliente'],
          idNegocio: pedido['id_negocio'],
          idSucursal: pedido['id_sucursal'],
          idRepartidor: pedido['id_repartidor'],
          idMetodoPago: pedido['id_metodo_pago'],
          costoEnvio: pedido['costo_envio'],
          subtotal: pedido['subtotal'],
          total: pedido['total'],
          latCliente: pedido['lat_cliente'],
          longCliente: pedido['long_cliente'],
          latNegocio: pedido['lat_negocio'],
          longNegocio: pedido['long_negocio'],
          estatusActual: pedido['estatus_actual']
        );
      }
    } on SocketException {
      respuesta.estatus = 0;
      respuesta.mensaje = 'No tienes conexión a internet.';
    } catch(e) {
      respuesta.estatus = 0;
      respuesta.mensaje = 'Error en la petición: $e';
    }
    return respuesta;
  }
}