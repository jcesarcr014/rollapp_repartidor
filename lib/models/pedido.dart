class Pedido {
  final int? id;
  final int? idCliente;
  final int? idNegocio;
  final int? idSucursal;
  final int? idRepartidor;
  final int? idMetodoPago;
  final String? costoEnvio;
  final String? subtotal;
  final String? total;
  final String? latCliente;
  final String? longCliente;
  final String? latNegocio;
  final String? longNegocio;
  final int? estatusActual;

  Pedido({
    this.id,
    this.idCliente,
    this.idNegocio,
    this.idSucursal,
    this.idRepartidor,
    this.idMetodoPago,
    this.costoEnvio,
    this.subtotal,
    this.total,
    this.latCliente,
    this.longCliente,
    this.latNegocio,
    this.longNegocio,
    this.estatusActual,
  });
}

List<Pedido> pedidos = [];
Pedido pedidoActual = Pedido();