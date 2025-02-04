import 'package:flutter/material.dart';
import 'package:rollapp_repartidor/main.dart';
import 'package:rollapp_repartidor/models/pedido.dart';
import 'package:rollapp_repartidor/providers/pedido.dart';
import 'package:rollapp_repartidor/widgets/loading.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final pedidoProvider = PedidoProvider();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if(_tabController.index == 0) {
        isLoading = true;
        setState(() {});
        pedidoProvider.obtenerPedidos().then((value) {
          isLoading = false;
          setState(() {});
        });
      }
    });

    isLoading = true;
    setState(() {});
    pedidoProvider.obtenerPedidos().then((value) {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Screen", style: theme.text20boldWhite),
        backgroundColor: theme.colorPrimary,
      ),
      body: isLoading ? const Loading() : Column(
        children: [
          const SizedBox(height: 10),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicator: BoxDecoration(border: Border(bottom: BorderSide(color: theme.colorPrimary, width: 4))),
            indicatorPadding: EdgeInsets.zero,
            tabs: List.generate(5, (index) => Tab(
                child: Text("Pestaña ${index + 1}", style: theme.text16bold, overflow: TextOverflow.ellipsis),
              ),
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Pestaña 1: Lista de pedidos con datos estáticos
                
                ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: pedidos.length, // Número de pedidos estáticos
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.colorPrimary,
                          child: Text((index + 1).toString(), style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text("Pedido #${pedidos[index].id}", style: theme.text16bold),
                        subtitle: Text("Detalles del pedido ${pedidos[index].id}", style: theme.text14),
                        trailing: Icon(Icons.arrow_forward_ios, color: theme.colorPrimary),
                        onTap: () {
                          debugPrint("Seleccionaste el Pedido #${index + 1}");
                          Navigator.pushNamed(context, 'order');
                        },
                      ),
                    );
                  },
                ),

                // Pestañas 2-5: Contenido por defecto
                for (int i = 2; i <= 5; i++)
                  Center(
                    child: Text(
                      "Estás en la Pestaña $i",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
