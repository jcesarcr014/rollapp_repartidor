import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/main.dart';
import 'package:rollapp_repartidor/widgets/ibutton2.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos estáticos para simular el pedido actual y sus detalles
    final orderDetails = {
      "id": "12345",
      "tipoServicio": "Alimentos",
      "fecha": "2025-01-13",
      "costo": "\$150.00",
      "metodoPago": "Tarjeta",
      "distancia": "5.2 km",
      "direccionOrigen": "Calle Principal 123",
      "direccionDestino": "Avenida Secundaria 456",
      "cliente": "Juan Pérez",
      "productos": [
        {"nombre": "Hamburguesa", "cantidad": 2, "imagen": "https://fastly.picsum.photos/id/366/50/50.jpg?hmac=pFsyUd5qk3LDuz1BhQCnPzwTG6WGALer6yeqvqiJ2wQ"},
        {"nombre": "Papas Fritas", "cantidad": 1, "imagen": "https://fastly.picsum.photos/id/366/50/50.jpg?hmac=pFsyUd5qk3LDuz1BhQCnPzwTG6WGALer6yeqvqiJ2wQ"},
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title:  Text("Detalles del Pedido", style: theme.text20boldWhite),
        backgroundColor: theme.colorPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información básica del pedido
            Text("Pedido #${orderDetails['id']}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Tipo de Servicio: ${orderDetails['tipoServicio']}",
                style: const TextStyle(fontSize: 16)),
            Text("Fecha: ${orderDetails['fecha']}",
                style: const TextStyle(fontSize: 16)),
            Text("Costo: ${orderDetails['costo']}",
                style: const TextStyle(fontSize: 16)),
            Text("Método de Pago: ${orderDetails['metodoPago']}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Información de direcciones
            const Text("Dirección de Origen:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(orderDetails['direccionOrigen']!.toString(),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text("Dirección de Destino:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(orderDetails['direccionDestino']!.toString(),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Detalles del cliente
            const Text("Cliente:",
                style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(orderDetails['cliente']!.toString(),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Detalles de productos
            const Text("Productos:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...List<Widget>.from((orderDetails['productos'] as List).map((producto) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Image.network(producto['imagen'], width: 50, height: 50),
                    const SizedBox(width: 10),
                    Text("${producto['cantidad']} x ${producto['nombre']}",
                        style: const TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,),
                  ],
                ),
              );
            })),

            const SizedBox(height: 30),

            // Botones de acción
            Center(
              child: Column(
                children: [
                  IButton2(pressButton: (){}, text: 'Recibir Pedido', color: theme.colorPrimary, textStyle: theme.text14boldWhite),
                  const SizedBox(height: 10),
                  IButton2(pressButton: (){}, text: 'Entregar Pedido', color: theme.colorPrimary, textStyle: theme.text14boldWhite),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}